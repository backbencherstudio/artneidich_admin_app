import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/theme/theme_extension/color_pallete.dart';

class CustomListTile extends StatelessWidget {
  final String leadingIconPath;
  final String title;
  // final String trailingIconPath;
  final Function()? onTap;
  final String? trailingText;
  final Widget? trailingWidget;
  const CustomListTile({
    super.key,
    required this.leadingIconPath,
    required this.title,
    // required this.trailingIconPath,
    this.onTap,
    this.trailingText,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: SvgPicture.asset(leadingIconPath, width: 20.h, height: 20.h),
      title: Text(
        title,
        style: textTheme.bodyLarge?.copyWith(
          color: AppColor.profileTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing:
          trailingWidget ??
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColor.profileTextColor,
          ),
    );
  }
}
