import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';


class AuthFooterText extends StatelessWidget{
  final String text1;
  final String text2;
  final Color? text2Color;
  final VoidCallback onTap;
  const AuthFooterText({super.key,
    required  this.text1,
    required this.text2,
    required this.onTap,
    this.text2Color,
  });

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: text1,
          style: bodyLarge?.copyWith(color: AppColor.secondaryTextColor),
          children: [
            TextSpan(
              text: text2,
              style: bodyLarge?.copyWith(color: text2Color ?? AppColor.secondaryColor),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );

  }
}
