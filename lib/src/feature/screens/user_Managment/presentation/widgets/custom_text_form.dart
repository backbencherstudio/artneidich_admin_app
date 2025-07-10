import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/color_pallete.dart';

class CustomTextForm extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextForm({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.textColor,
                  ),
                ),
                TextSpan(
                  text: "*",
                  style: textTheme.bodyMedium!.copyWith(color: AppColor.error),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 6.h,),
        TextFormField(
          controller: controller,
        ),
      ],
    );
  }
}
