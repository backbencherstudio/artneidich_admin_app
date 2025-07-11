import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/routes/route_constant.dart';
import '../../../../../../../core/theme/theme_extension/color_pallete.dart';

Future<void> logOutBottomSheet({required BuildContext context, required WidgetRef ref}) async {
 
   ref.read(bottomSheetVisibilityProvider.notifier).state = true;

  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      final textTheme = Theme.of(context).textTheme;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Container(
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColor.textColor,
                ),
              ),
              SizedBox(height: 36.h),
              SvgPicture.asset(AppIcons.logOut),
              SizedBox(height: 16.h),
              Text(
                "Are You Sure?",
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Do you want to logout?",
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColor.secondaryTextColor,
                ),
              ),
              SizedBox(height: 34.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.w,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffECEFF3),
                      ),
                      onPressed: () => context.pop(),
                      child: Text(
                        "Cancel",
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.error,
                      ),
                      onPressed: () => context.go(RouteConst.signInScreen),
                      child: Text(
                        "Logout",
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      );
    },
  ).whenComplete((){
      ref.read(bottomSheetVisibilityProvider.notifier).state = false;

  });
}
