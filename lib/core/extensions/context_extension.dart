import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// MediaQuery
  bool get isDark => MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get deviceHeight => MediaQuery.sizeOf(this).height;
  double get viewInsetsBottom => MediaQuery.viewInsetsOf(this).bottom;
  bool get isIphoneSE1 =>
      deviceWidth == 320 && deviceHeight == 568; // iPhone SE 1st
  bool get isTablet =>
      MediaQuery.sizeOf(this).shortestSide >=
      600; // https://stackoverflow.com/a/54136738
  double get appBarHeight => MediaQuery.paddingOf(this).top + kToolbarHeight;
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Theme
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  TextStyle get titleStyle => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get subtitleStyle => Theme.of(this).textTheme.titleMedium!;
  TextStyle get bodyStyle => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get smallStyle =>
      Theme.of(this).textTheme.bodySmall!.copyWith(fontSize: 13);
  TextStyle get verySmallStyle =>
      Theme.of(this).textTheme.bodySmall!.copyWith(fontSize: 10);

  Color get primaryColor => Theme.of(this).primaryColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// Function
  void hideKeyboard() {
    // https://github.com/flutter/flutter/issues/54277#issuecomment-640998757
    final currentScope = FocusScope.of(this);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void showSnackBar(
    String text, {
    Color? backgroundColor,
    Duration duration = const Duration(milliseconds: 1500),
    VoidCallback? onTap,
    String closeLabel = '閉じる',
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? primaryColor,
        content: Text(text),
        duration: duration,
        action: SnackBarAction(
          label: closeLabel,
          onPressed: () {
            onTap?.call();
          },
        ),
      ),
    );
  }
}
