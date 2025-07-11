import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/theme/theme_extension/color_pallete.dart';
import 'log_out_bottom_sheet.dart';

class LogOutCard extends StatelessWidget {
  const LogOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async{
          await logOutBottomSheet(context: context);
        },
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 19.h),
          backgroundColor: Color(0xffFEECEE),
        ),
        child: Text(
          "Log Out",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.error),
        ),
      ),
    );
  }
}
