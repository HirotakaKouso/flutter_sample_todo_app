import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_todo_app/features/authentication/pages/login_page.dart';
import 'package:flutter_sample_todo_app/features/authentication/pages/sign_up_page.dart';
import 'package:flutter_sample_todo_app/features/todo/pages/body/todo_page.dart';
import 'package:go_router/go_router.dart';

part 'route.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

@TypedGoRoute<TodoRoute>(
  path: '/',
  name: 'todo',
)
class TodoRoute extends GoRouteData {
  const TodoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TodoPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  name: 'login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}


@TypedGoRoute<SignUpRoute>(
  path: '/sign_up',
  name: 'sign_up',
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SignUpPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
