import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/routes/route_constant.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../widgets/auth_footer_text.dart';
import '../model/otp_screen_parameter_model.dart';

class OtpScreen extends StatelessWidget {
  final OtpParameterModel otpParameterModel;
  const OtpScreen({super.key, required this.otpParameterModel});

  @override
  Widget build(BuildContext context) {
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter OTP", style: headlineSmall),
              SizedBox(height: 2.h),
              Text("Please enter your OTP", style: titleSmall),
              SizedBox(height: 40.h),
              PinCodeTextField(
                autoFocus: true,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(14.r),
                  fieldHeight: 56.h,
                  fieldWidth: 37.w,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: AppColor.primaryColor,
                  selectedColor: AppColor.primaryColor,
                  inactiveColor: Color(0xFFE9EAEC),
                  borderWidth: 1,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {},
                appContext: context,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      otpParameterModel.routeName == RouteConst.signInScreen
                      ? context.pushReplacement(
                          RouteConst.passwordResetScreen,
                          extra: otpParameterModel,
                        )
                      : context.pushReplacement(
                          RouteConst.successfulScreen,
                          extra: otpParameterModel,
                        ),
                  child: Text("Submit"),
                ),
              ),
              SizedBox(height: 16.h),
              AuthFooterText(
                text1: "Haven't you got the OTP yet? ",
                text2: "Resend Code",
                text2Color: AppColor.primaryColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
