import 'package:flutter/material.dart';
import 'package:flutter_sample_todo_app/core/res/theme.dart';
import 'package:flutter_sample_todo_app/core/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'flutter_sample_todo_app',
      theme: getAppTheme(context),
      darkTheme: getAppThemeDark(context),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
