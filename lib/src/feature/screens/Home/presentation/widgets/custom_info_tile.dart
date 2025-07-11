import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_sticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInfoTile extends StatelessWidget {
  final String lebel;
  final String count;
  final String icon;
  final Color color;
  const CustomInfoTile({
    super.key,
    required this.count,
    required this.lebel,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 111.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xffECEFF3),
        width: 2.0),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSticker(color: color, icon: icon),
            SizedBox(height: 16.h),
            Text(
              count,
              style: textTheme.titleMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryTextColor,
              ),
            ),
            SizedBox(height: 9.h),

            Text(
              lebel,
              style: textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
