import 'package:artneidich_admin/src/core/constant/icons.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:artneidich_admin/src/feature/common_widgets/commonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'menu_card.dart';

class LabelCard extends ConsumerWidget {
  final int index;
  final String label;
  final GlobalKey menuKey = GlobalKey();
  LabelCard({super.key, required this.index, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 11.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColor.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index < 10 ? "0$index" : index}. $label",
            style: textTheme.bodyLarge,
          ),
          GestureDetector(
            key: menuKey,
            onTap: () async {
              final value = await customPopupMenu(
                key: menuKey,
                context: context,
                list: {"Edit", "Delete"},
                iconListPath: [AppIcons.editIcon, AppIcons.delete],
              );
              if (value == "Delete") {
                if (context.mounted) {
                  CommonWidget.deleteSheet(context: context, onTap: () {}, ref:ref );
                }
              }

              debugPrint("\nSelected value : $value\n");
            },
            child: SvgPicture.asset(AppIcons.threedot),
          ),
        ],
      ),
    );
  }
}
