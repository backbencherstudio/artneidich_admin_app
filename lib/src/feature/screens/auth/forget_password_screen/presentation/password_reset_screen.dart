import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_constant.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../otp_screen/model/otp_screen_parameter_model.dart';
import '../../sign_in_screen/riverpod/single_value_provider/password_visibility_provider.dart';

class PasswordResetScreen extends StatelessWidget {
  final OtpParameterModel otpParameterModel;
  const PasswordResetScreen({super.key, required this.otpParameterModel});

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
              Text("Change your password", style: textTheme.headlineSmall),
              SizedBox(height: 2.h),
              Text(
                "Your new password must be different from previously used password",
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColor.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Consumer(
                builder: (_, ref, _) {
                  final isObscure = ref.watch(passwordVisibilityProvider);
                  return TextFormField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      hintText: "Enter your new password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 5.w),
                        child: Icon(
                          Icons.lock_outline,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () => ref
                            .read(passwordVisibilityProvider.notifier)
                            .toggleVisibility(),
                        child: Icon(
                          isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              Consumer(
                builder: (_, ref, _) {
                  final isObscure = ref.watch(
                    confirmPasswordVisibilityProvider,
                  );
                  return TextFormField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      hintText: "Confirm your new password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 5.w),
                        child: Icon(
                          Icons.lock_outline,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () => ref
                            .read(confirmPasswordVisibilityProvider.notifier)
                            .toggleVisibility(),
                        child: Icon(
                          isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.pushReplacement(
                    RouteConst.successfulScreen,
                    extra: otpParameterModel,
                  ),
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
