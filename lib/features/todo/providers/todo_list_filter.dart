import 'package:flutter_sample_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_sample_todo_app/features/todo/entities/todo.dart';
import 'package:flutter_sample_todo_app/features/todo/enums/todo_list_filters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_filter.g.dart';

@Riverpod(keepAlive: true)
class TodoListFilter extends _$TodoListFilter {
  @override
  TodoListFilters build() {
    return TodoListFilters.all;
  }

  TodoListFilters check(TodoListFilters filter) {
    return state = filter;
  }
}

@riverpod
Future<List<Todo>> filteredTodoList(Ref ref) async {
  final todoList = await ref.watch(todoControllerProvider.future);
  final todoListFilter = ref.watch(todoListFilterProvider);

  switch (todoListFilter) {
    case TodoListFilters.all:
      return todoList;
    case TodoListFilters.active:
      return todoList.where((todo) => !todo.completed).toList();
    case TodoListFilters.completed:
      return todoList.where((todo) => todo.completed).toList();
  }
}
