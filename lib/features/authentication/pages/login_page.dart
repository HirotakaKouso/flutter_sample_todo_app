import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_todo_app/core/extensions/context_extension.dart';
import 'package:flutter_sample_todo_app/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_sample_todo_app/core/use_cases/authentication/auth_state_controller.dart';
import 'package:flutter_sample_todo_app/features/authentication/pages/sign_up_page.dart';
import 'package:flutter_sample_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final authRepository = ref.watch(firebaseAuthRepositoryProvider);

    return SelectionArea(
      child: GestureDetector(
        onTap: () => context.hideKeyboard(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Login Page')),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Spacer(),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      context.showSnackBar('EmailとPasswordを入力してください');
                      return;
                    }

                    try {
                      await authRepository.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      ref
                        ..invalidate(authStateControllerProvider)
                        ..invalidate(todoControllerProvider);
                      context.showSnackBar('ログイン成功しました');

                      Navigator.pop(context);
                    } on Exception catch (e) {
                      context.showSnackBar('Sign in failed: $e');
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text('SignUp'),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
