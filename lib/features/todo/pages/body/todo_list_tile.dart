import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_sample_todo_app/features/todo/entities/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListTile extends HookConsumerWidget {
  const TodoListTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemFocusNode = useFocusNode();
    final itemIsFocused = useIsFocused(itemFocusNode);
    final textFieldFocusNode = useFocusNode();
    final textEditingController = useTextEditingController();
    return Focus(
      focusNode: itemFocusNode,
      onFocusChange: (focused) async {
        if (focused) {
          textEditingController.text = todo.description;
        } else {
          await ref.read(todoControllerProvider.notifier).edit(
                todo: Todo(
                  todoId: todo.todoId,
                  description: textEditingController.text,
                  completed: todo.completed,
                ),
              );
        }
      },
      child: ListTile(
        onTap: () {
          itemFocusNode.requestFocus();
          textFieldFocusNode.requestFocus();
        },
        title: itemIsFocused
            ? TextField(
                autofocus: true,
                focusNode: textFieldFocusNode,
                controller: textEditingController,
              )
            : Text(todo.description),
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) =>
              ref.read(todoControllerProvider.notifier).toggle(id: todo.todoId),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            await ref
                .read(todoControllerProvider.notifier)
                .remove(docId: todo.todoId);
          },
        ),
      ),
    );
  }
}

bool useIsFocused(FocusNode node) {
  final isFocused = useState(node.hasFocus);

  useEffect(
    () {
      void listener() {
        isFocused.value = node.hasFocus;
      }

      node.addListener(listener);
      return () => node.removeListener(listener);
    },
    [node],
  );

  return isFocused.value;
}
