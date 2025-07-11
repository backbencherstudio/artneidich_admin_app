import 'package:artneidich_admin/src/core/constant/icons.dart';
import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/theme_extension/color_pallete.dart';

Future<void> showDeleteSheet({
  required BuildContext context,
  required Function onTap,
   WidgetRef ?ref,
}) async {
  final textTheme = Theme.of(context).textTheme;
  ref?.read(bottomSheetVisibilityProvider.notifier).state = true;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.all(24.r),
            margin: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 20.h,
             
            ),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 5.w,
                    width: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff171717),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffED544E).withValues(alpha: 0.05),
                    border: Border.all(
                      color: Color(0xffE63946).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: SvgPicture.asset(AppIcons.deleteicon),
                  ),
                ),

                Text(
                  "Are You Sure?",

                  style: textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 5.h),

                Text(
                  "Do you want to leave this user?",
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffECEFF3),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 13.h,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: textTheme.bodyLarge!.copyWith(
                              color: AppColor.primaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.error,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 13.h,
                            ),
                          ),
                          onPressed: () {
                            onTap();
                          },
                          child: Text("Delete"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  ).whenComplete(

    (){
       ref?.read(bottomSheetVisibilityProvider.notifier).state = false;
    }
  );
}
