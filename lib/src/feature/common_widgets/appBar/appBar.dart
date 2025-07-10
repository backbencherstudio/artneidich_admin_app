import 'package:artneidich_admin/src/core/constant/icons.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      // leading: GestureDetector(
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: SvgPicture.asset(AppIcons.backButton),
      //   )),
      title: Center(
        child: Text(
          title!,
          style: textTheme.titleSmall!.copyWith(
            fontSize: 18.sp,
            color: AppColor.primaryTextColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 18.w),
          child: Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.surfaceColor,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.bell),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
