import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/icons.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';

class CustomJobDetailTile extends StatelessWidget {

 final int index;
  final String inspectorName;
  final String address;
  final String fhaNumber;
  final String createdAt;
  final String completedAt;
  final String status;
  final String? adminNote;

  const CustomJobDetailTile({
    super.key,
    required this.index,
    required this.inspectorName,
    required this.address,
    required this.fhaNumber,
    required this.createdAt,
    required this.completedAt,
    required this.status,
    required this.adminNote,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 357.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColor.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            Row(
              children: [
                Text(
                  "0$index.",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryTextColor,
                  ),
                ),
                Text(
                  "Job",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryTextColor,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(AppIcons.threedot),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: AppColor.dividerColor, thickness: 1.2),
            SizedBox(height: 16.h),
            CustomRowText(title: "Inspector Name", discription: inspectorName),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Address', discription: address),
            SizedBox(height: 16.h),
            CustomRowText(title: 'FHA Number', discription: fhaNumber),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Created', discription: createdAt),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Completed', discription: completedAt),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Status', discription: status),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Admin Note', discription: adminNote ?? "-----"),
          ],
        ),
      ),
    );
  }
}
