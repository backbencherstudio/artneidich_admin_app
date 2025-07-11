import 'package:artneidich_admin/src/core/constant/icons.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:artneidich_admin/src/feature/common_widgets/commonWidget.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_row_text.dart';
import 'package:artneidich_admin/src/feature/screens/label_management_screens/presentation/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDetailsTile extends ConsumerWidget {
  final int index;
  final String userName;
  final String email;
  final String phoneNumber;
  final String role;
  final GlobalKey _key = GlobalKey();
  CustomDetailsTile({
    super.key,
    required this.index,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 357.w,
      margin: EdgeInsets.only(bottom: 11.h),
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
                  "User",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryTextColor,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  key: _key,
                  onTap: () async {
                    final value = await customPopupMenu(
                      context: context,
                      key: _key,
                      list: {"Edit", "Delete"},
                      iconListPath: [AppIcons.editIcon, AppIcons.delete],
                    );
                    if (value != null) {
                      debugPrint('\n\n$value\n\n');
                    }
                    if (value == 'Delete') {
                      // showDeleteSheet(context: context, ref: ref, onTap: () {});

                      CommonWidget.deleteSheet(context: context, onTap: (){}, ref: ref);
                    }
                  },
                  child: SvgPicture.asset(AppIcons.threedot),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: AppColor.dividerColor, thickness: 1.2),
            SizedBox(height: 16.h),
            CustomRowText(title: 'User Name', discription: userName),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Email', discription: email),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Phone Number', discription: phoneNumber),
            SizedBox(height: 16.h),
            CustomRowText(title: 'Role', discription: role),
          ],
        ),
      ),
    );
  }
}
