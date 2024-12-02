import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoFloatingActionButton extends ConsumerWidget {
  const TodoFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await showTextInputDialog(
          context: context,
          textFields: [
            const DialogTextField(
              hintText: 'Todoを入力してください',
              keyboardType: TextInputType.text,
            ),
          ],
        );
        if (result != null && result.isNotEmpty) {
          await ref
              .read(todoControllerProvider.notifier)
              .add(description: result.first);
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
