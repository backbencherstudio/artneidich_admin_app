import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_text_field.dart';
class DateFields extends StatelessWidget {
  const DateFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BuildTextField(label: 'Created Date:', hintText: '2025-06-07'),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: BuildTextField(
            label: 'Completed Date:',
            hintText: '2025-06-07',
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
