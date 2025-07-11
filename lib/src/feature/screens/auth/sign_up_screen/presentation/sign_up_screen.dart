import 'package:artneidich_admin/src/feature/screens/auth/sign_up_screen/presentation/widgets/email_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_constant.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../sign_in_screen/presentation/widgets/google_sign_in.dart';
import '../../widgets/auth_footer_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    "Create Your Account",
                    style: textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign up and enjoy your experience",
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColor.secondaryTextColor,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                EmailSignUp(),

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
                  text1: "Already have an account?",
                  text2: " Log In",
                  onTap: ()=>context.go(RouteConst.signInScreen),
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
