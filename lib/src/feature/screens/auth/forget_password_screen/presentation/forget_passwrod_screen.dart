import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_constant.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../otp_screen/model/otp_screen_parameter_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot Password", style: textTheme.headlineSmall),
            SizedBox(height: 2.h),
            Text(
              "Please enter your email address",
              style: textTheme.titleSmall?.copyWith(
                color: AppColor.secondaryTextColor,
                letterSpacing: 1.w,
              ),
            ),
            SizedBox(height: 40.h),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 5.w),
                  child: Icon(
                    Icons.email_outlined,
                    color: AppColor.secondaryTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.push(
                  RouteConst.otpVerificationScreen,
                  extra: OtpParameterModel(
                    routeName: RouteConst.signInScreen,
                    successfulTitle: "Successful",
                    successfulBody:
                        "Congratulations! Your password has been successfully updated. Click Continue to login",
                  ),
                ),
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
