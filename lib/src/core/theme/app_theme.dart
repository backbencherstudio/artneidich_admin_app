
import 'package:artneidich_admin/src/core/theme/part/app_bar_theme.dart';
import 'package:artneidich_admin/src/core/theme/part/elevated_button_theme.dart';
import 'package:artneidich_admin/src/core/theme/part/input_decoration_theme.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.lightEvaluatedButtonTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    colorScheme: AppColor.lightColorScheme,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  );
}
