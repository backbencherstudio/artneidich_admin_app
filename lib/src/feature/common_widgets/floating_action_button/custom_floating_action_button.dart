import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme_extension/color_pallete.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function onTap;
  const CustomFloatingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: 98.w,
        height: 60.h,
        child: FloatingActionButton(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.r),
          ),
          backgroundColor: AppColor.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add), Text("Add")],
          ),
          onPressed: () {
            onTap();
          },
        ),
      ),
    );
  }
}
