// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodoListHash() => r'4e8fe2b553de650b149349b2a82f1a789c3efc84';

/// See also [filteredTodoList].
@ProviderFor(filteredTodoList)
final filteredTodoListProvider = AutoDisposeFutureProvider<List<Todo>>.internal(
  filteredTodoList,
  name: r'filteredTodoListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTodoListRef = AutoDisposeFutureProviderRef<List<Todo>>;
String _$todoListFilterHash() => r'e951d62d2e9e329215d6e306c45bdb3bc913db12';

/// See also [TodoListFilter].
@ProviderFor(TodoListFilter)
final todoListFilterProvider =
    NotifierProvider<TodoListFilter, TodoListFilters>.internal(
  TodoListFilter.new,
  name: r'todoListFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoListFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoListFilter = Notifier<TodoListFilters>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
