import 'package:artneidich_admin/src/core/constant/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/theme_extension/color_pallete.dart';

Future<String?> customPopupMenu({
  required BuildContext context,
  required GlobalKey key,
  required Set<String> list,
}) async {
  final RenderBox renderBox =
  key.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);

  /// top-left position
  final Size size = renderBox.size;

  final result = await showMenu<String>(
    context: context,
    color: Colors.white,
    elevation: 20,
    shadowColor: Colors.grey.withValues(alpha: 0.2),
    constraints: BoxConstraints(
      minWidth: 150.w,
      maxHeight: 130.h,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    position: RelativeRect.fromLTRB(
      190.w,
      offset.dy + size.height,
      20.w,
      offset.dy,
    ),
    items: () {
      List<PopupMenuEntry<String>> menuItems = [];
      final areasList = list.toList();

      /// Convert Set to List
      for (int i = 0; i < areasList.length; i++) {
        menuItems.add(
          PopupMenuItem(
            value: areasList[i],
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              spacing: 6.w,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset( i==0 ? AppIcons.editIcon : AppIcons.delete),
                Text(
                  areasList[i],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );

        /// Add a divider after each item except the last one
        if (i < areasList.length - 1) {
          menuItems.add(
            const PopupMenuDivider(color: AppColor.borderColor),
          );
        }
      }
      return menuItems;
    }(),
  );

  return result;
}