import 'package:flutter_sample_todo_app/core/exceptions/app_exception.dart';
import 'package:flutter_sample_todo_app/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_sample_todo_app/core/repositories/firestore/collection_paging_repository.dart';
import 'package:flutter_sample_todo_app/core/repositories/firestore/document.dart';
import 'package:flutter_sample_todo_app/core/repositories/firestore/document_repository.dart';
import 'package:flutter_sample_todo_app/core/use_cases/authentication/auth_state_controller.dart';
import 'package:flutter_sample_todo_app/features/todo/entities/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';

@riverpod
CollectionPagingRepository<Todo> collectionPagingRepository(
  Ref ref,
  CollectionParam<Todo> query,
) {
  return CollectionPagingRepository<Todo>(
    query: query.query,
    initialLimit: query.initialLimit,
    pagingLimit: query.pagingLimit,
    decode: query.decode,
  );
}

@riverpod
class TodoController extends _$TodoController {
  static int get defaultLimit => 20;

  CollectionPagingRepository<Todo>? _collectionPagingRepository;

  @override
  FutureOr<List<Todo>> build() async {
    ref.watch(authStateControllerProvider);

    final userId = ref.watch(firebaseAuthRepositoryProvider).loggedInUserId;

    if (userId == null) {
      return [];
    }

    final length = state.value?.length ?? 0;
    final repository = ref.watch(
      collectionPagingRepositoryProvider(
        CollectionParam<Todo>(
          query: Document.colRef(
            Todo.collectionPath(userId),
          ).orderBy('createdAt', descending: true),
          initialLimit: length > defaultLimit ? length + 1 : defaultLimit,
          pagingLimit: defaultLimit,
          decode: Todo.fromJson,
        ),
      ),
    );
    _collectionPagingRepository = repository;

    final data = await repository.fetch(
      fromCache: (cache) {
        /// キャッシュから即時反映する
        state = AsyncData(
          cache.map((e) => e.entity).whereType<Todo>().toList(),
        );
      },
    );
    return data.map((e) => e.entity).whereType<Todo>().toList();
  }

  /// ページング取得
  Future<void> onFetchMore() async {
    final repository = _collectionPagingRepository;
    if (repository == null) {
      throw AppException.irregular();
    }

    final data = await repository.fetchMore();
    final previousState = await future;
    if (data.isNotEmpty) {
      state = AsyncData([
        ...previousState,
        ...data.map((e) => e.entity).whereType<Todo>(),
      ]);
    }
  }

  Future<void> add({required String description}) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }

    final docRef = Document.docRef(Todo.collectionPath(userId));
    final now = DateTime.now();
    final data = Todo(
      todoId: docRef.id,
      description: description,
      createdAt: now,
      updatedAt: now,
    );

    await ref.read(documentRepositoryProvider).save(
          Todo.docPath(userId, docRef.id),
          data: data.toCreateDoc,
        );
    final previousState = await future;
    state = AsyncData([data, ...previousState]);
  }

  Future<void> toggle({required String id}) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final currentTodos = state.valueOrNull ?? [];
    final todo = currentTodos.firstWhere((t) => t.todoId == id);

    final data = todo.copyWith(updatedAt: DateTime.now());
    await ref.read(documentRepositoryProvider).update(
          Todo.docPath(userId, id),
          data: data.toUpdateDoc,
        );

    state = AsyncData(
      currentTodos.map((t) {
        return t.todoId == id ? t.copyWith(completed: !t.completed) : t;
      }).toList(),
    );
  }

  Future<void> edit({required Todo todo}) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final value = await future;
    if (value.isEmpty) {
      throw AppException(title: '更新できません');
    }
    final docId = todo.todoId;
    final data = todo.copyWith(updatedAt: DateTime.now());
    await ref.read(documentRepositoryProvider).update(
          Todo.docPath(userId, docId),
          data: data.toUpdateDoc,
        );
    state = AsyncData(
      value
          .map(
            (e) => e.todoId == todo.todoId ? todo : e,
          )
          .toList(),
    );
  }

  Future<void> remove({required String docId}) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final value = await future;
    if (value.isEmpty) {
      throw AppException(title: '削除できません');
    }
    await ref
        .read(documentRepositoryProvider)
        .remove(Todo.docPath(userId, docId));
    state = AsyncData(
      value
          .where(
            (e) => e.todoId != docId,
          )
          .toList(),
    );
  }
}
