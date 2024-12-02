import 'package:flutter/material.dart';
import 'package:flutter_sample_todo_app/features/todo/enums/todo_list_filters.dart';
import 'package:flutter_sample_todo_app/features/todo/providers/todo_list_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoToolBar extends ConsumerWidget {
  const TodoToolBar({
    super.key,
    required this.todoListLength,
  });

  final int todoListLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('合計: $todoListLength'),
        Tooltip(
          message: 'All todos',
          child: TextButton(
            onPressed: () => ref
                .read(todoListFilterProvider.notifier)
                .check(TodoListFilters.all),
            child: const Text('All'),
          ),
        ),
        Tooltip(
          message: 'Only uncompleted todos',
          child: TextButton(
            onPressed: () => ref
                .read(todoListFilterProvider.notifier)
                .check(TodoListFilters.active),
            child: const Text('Active'),
          ),
        ),
        Tooltip(
          message: 'Only completed todos',
          child: TextButton(
            onPressed: () => ref
                .read(todoListFilterProvider.notifier)
                .check(TodoListFilters.completed),
            child: const Text('Completed'),
          ),
        ),
      ],
    );
  }
}
