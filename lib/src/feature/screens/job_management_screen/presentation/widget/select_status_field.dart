import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/color_pallete.dart';
class SelectStatusField extends StatelessWidget {
  const SelectStatusField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Status:'),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
            border: Border.all(color: AppColor.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Status'),
              SizedBox(width: 10.w),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ],
    );
  }
}
