import 'package:flutter/material.dart';
import 'package:flutter_sample_todo_app/core/extensions/context_extension.dart';
import 'package:flutter_sample_todo_app/features/todo/pages/app_bar/todo_app_bar.dart';
import 'package:flutter_sample_todo_app/features/todo/pages/body/todo_list_tile.dart';
import 'package:flutter_sample_todo_app/features/todo/pages/body/todo_tool_bar.dart';
import 'package:flutter_sample_todo_app/features/todo/pages/floating_action_button/todo_floating_action_button.dart';
import 'package:flutter_sample_todo_app/features/todo/providers/todo_list_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoAsync = ref.watch(filteredTodoListProvider);

    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        appBar: const TodoAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(28),
            child: todoAsync.when(
              data: (todoList) {
                return Column(
                  children: [
                    const TodoToolBar(todoListLength: 0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          final todo = todoList[index];
                          return TodoListTile(todo: todo);
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) {
                return Center(child: Text('エラー: $error'));
              },
            )),
        floatingActionButton: const TodoFloatingActionButton(),
      ),
    );
  }
}
