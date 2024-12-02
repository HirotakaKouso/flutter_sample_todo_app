import 'package:flutter/material.dart';
import 'package:flutter_sample_todo_app/core/extensions/context_extension.dart';
import 'package:flutter_sample_todo_app/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_sample_todo_app/core/router/route.dart';
import 'package:flutter_sample_todo_app/core/use_cases/authentication/auth_state_controller.dart';
import 'package:flutter_sample_todo_app/core/use_cases/authentication/is_logged_in.dart';
import 'package:flutter_sample_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return SelectionArea(
      child: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: isLoggedIn
                ? const Icon(Icons.logout, color: Colors.red)
                : const Icon(Icons.login, color: Colors.blue),
            onPressed: () async {
              if (isLoggedIn) {
                context.showSnackBar('ログアウトしました');
                await ref.read(firebaseAuthRepositoryProvider).signOut();
                ref
                  ..invalidate(authStateControllerProvider)
                  ..invalidate(todoControllerProvider);
              } else {
                await const LoginRoute().push<void>(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
