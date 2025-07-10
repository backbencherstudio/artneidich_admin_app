import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routes/route_constant.dart';
import '../../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../riverpod/single_value_provider/password_visibility_provider.dart';
import '../../riverpod/single_value_provider/remember_me_provider.dart';

class EmailSignIn extends StatelessWidget {
  const EmailSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 16.h,
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: "Enter your email"),
        ),

        Consumer(
          builder: (_, ref, _) {
            final isObscure = ref.watch(passwordVisibilityProvider);
            return TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: "Enter your password",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 2.w,
          children: [
            Consumer(
              builder: (_, ref, _) {
                final isRemember = ref.watch(rememberMeProvider);
                return Checkbox(
                  activeColor: AppColor.secondaryColor,
                  shape: OvalBorder(),
                  value: isRemember,
                  onChanged: (value) {
                    ref.read(rememberMeProvider.notifier).toggleRememberMe();
                  },
                );
              },
            ),
            Text("Remember me", style: textTheme.bodyLarge?.copyWith(color: AppColor.secondaryTextColor)),
            Spacer(),
            TextButton(
              onPressed: ()=>context.push(RouteConst.forgetPasswordScreen),
              child: Text(
                "Forgot Password?",
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColor.secondaryColor,
                ),
              ),
            ),
            SizedBox(height: 40.h,),

          ],
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: ()=>context.go(RouteConst.homeScreen),
              child: Text("Log In"),
          ),
        )
      ],
    );
  }
}
