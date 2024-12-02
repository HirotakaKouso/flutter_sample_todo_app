import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todo_app/core/gen/fonts.gen.dart';
import 'package:flutter_sample_todo_app/core/res/colors.dart';

/// Migrating a Flutter app to Material 3
/// https://blog.codemagic.io/migrating-a-flutter-app-to-material-3/

TextTheme _getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme.copyWith(

      /// テキストテーマを変更する場合はここを修正
      );
}

ThemeData getAppTheme(BuildContext context) {
  const primaryColor = Colors.black;
  final textTheme = _getTextTheme(context);

  final base = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      surfaceTint: Colors.white,
    ),
    textTheme: textTheme,
    fontFamily: FontFamily.inter,
  );

  return base.copyWith(
    scaffoldBackgroundColor: kLightGray1Color,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
    ),
    appBarTheme: base.appBarTheme.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.white),
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: base.textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      centerTitle: true,
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black.withOpacity(0.4),
    ),
    listTileTheme: base.listTileTheme.copyWith(
      titleTextStyle: base.textTheme.bodyMedium,
      subtitleTextStyle: base.textTheme.bodyMedium,
    ),
    dividerTheme: base.dividerTheme.copyWith(
      color: Colors.black12,
    ),
    cardTheme: base.cardTheme.copyWith(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: base.textTheme.bodyMedium?.copyWith(
          fontSize: 15,
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android:
            CupertinoPageTransitionsBuilder(), // AndroidもCupertinoPageTransitionsBuilderに設定する
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}

ThemeData getAppThemeDark(BuildContext context) {
  const primaryColor = Colors.blueAccent;
  final textTheme = _getTextTheme(context);

  final base = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      brightness: Brightness.dark,
      surfaceTint: Colors.white,
    ),
    textTheme: textTheme,
    fontFamily: FontFamily.inter,
  );

  return base.copyWith(
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
    ),
    appBarTheme: base.appBarTheme.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.white),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      titleTextStyle: base.textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      centerTitle: true,
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      selectedItemColor: primaryColor,
    ),
    listTileTheme: base.listTileTheme.copyWith(
      titleTextStyle: base.textTheme.bodyMedium,
      subtitleTextStyle: base.textTheme.bodyMedium,
    ),
    cardTheme: base.cardTheme.copyWith(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: base.textTheme.bodyMedium?.copyWith(
          fontSize: 15,
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android:
            CupertinoPageTransitionsBuilder(), // AndroidもCupertinoPageTransitionsBuilderに設定する
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
