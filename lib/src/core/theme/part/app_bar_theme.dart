import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: GoogleFonts.inter(
      color: AppColor.textColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}
