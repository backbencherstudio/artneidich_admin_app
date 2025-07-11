import 'package:artneidich_admin/src/feature/screens/auth/sign_in_screen/presentation/widgets/email_sign_in.dart';
import 'package:artneidich_admin/src/feature/screens/auth/sign_in_screen/presentation/widgets/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_constant.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../widgets/auth_footer_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi! Welcome Back",
                    style: textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log in to your account",
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColor.secondaryTextColor,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                EmailSignIn(),

                SizedBox(height: 44.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Divider(color: AppColor.dividerColor)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Text(
                        "Or",
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColor.dividerColor)),
                  ],
                ),
                SizedBox(height: 44.h),
                GoogleSignIn(),
                SizedBox(height: 44.h),
                AuthFooterText(
                  text1: "Don't have an account? ",
                  text2: "Sign Up",
                  onTap: ()=>context.go(RouteConst.signUpScreen),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
