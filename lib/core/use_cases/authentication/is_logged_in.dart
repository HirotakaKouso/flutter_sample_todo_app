import 'package:flutter_sample_todo_app/core/use_cases/authentication/auth_state_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_logged_in.g.dart';

@riverpod
bool isLoggedIn(Ref ref) {
  final authState = ref.watch(authStateControllerProvider);
  return authState == AuthState.signIn;
}
