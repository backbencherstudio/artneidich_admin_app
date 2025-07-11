import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routes/route_constant.dart';
import '../../../otp_screen/model/otp_screen_parameter_model.dart';
import '../../../sign_in_screen/riverpod/single_value_provider/password_visibility_provider.dart';

class EmailSignUp extends StatelessWidget {
  const EmailSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 16.h,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Your name",
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Your email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),

        Consumer(
          builder: (_, ref, _) {
            final isObscure = ref.watch(passwordVisibilityProvider);
            return TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: "Create your password",
                prefixIcon: Icon(Icons.lock_outline),
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
        Consumer(
          builder: (_, ref, _) {
            final isObscure = ref.watch(confirmPasswordVisibilityProvider);
            return TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: "Confirm your password",
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
                prefixIcon: Icon(Icons.lock_outline),
              ),
            );
          },
        ),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.push(
              RouteConst.otpVerificationScreen,
              extra: OtpParameterModel(
                routeName: RouteConst.homeScreen,
                successfulTitle: "Successfully Registered",
                successfulBody:
                    "Your account has been registered successfully, now let's enjoy Inspection features!",
              ),
            ),
            child: Text("Continue"),
          ),
        ),
      ],
    );
  }
}
