import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/color_pallete.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.lightGray),
            ),
            onPressed: () {},
            child: Text('Cancel', style: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                 // showLogouttSheet(context, ref);
                },
                child: Text('Submit'),
              );
            },
          ),
        ),
      ],
    );
  }
}
