
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/constant/padding.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../otp_screen/model/otp_screen_parameter_model.dart';

class SuccessfulScreen extends StatelessWidget {
  final OtpParameterModel otpParameterModel;
  const SuccessfulScreen({super.key, required this.otpParameterModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h),
              SvgPicture.asset(AppIcons.successful),
              Text(
                otpParameterModel.successfulTitle,
                style: textTheme.headlineSmall,
              ),
              SizedBox(height: 8.h),
              Text(
                otpParameterModel.successfulBody,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColor.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go(otpParameterModel.routeName),
                  child: Text("Continue"),
                ),
              ),
              SizedBox(height: 27.h),
            ],
          ),
        ),
      ),
    );
  }
}
