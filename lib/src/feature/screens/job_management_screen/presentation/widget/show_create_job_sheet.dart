import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';

void showCreateJobSheet(BuildContext context, WidgetRef ref) {
  /// Set bottom sheet visibility to true when showing the logout sheet
  ref.read(bottomSheetVisibilityProvider.notifier).state = true;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (context) {
      TextTheme textTheme = Theme.of(context).textTheme;
      return IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(24.r),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          ),
          child: Consumer(
            builder: (context, ref, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create New Job', style: textTheme.titleMedium),
                  SizedBox(height: 24.h),
                  Text('Inspector:'),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.r),
                      border: Border.all(color: AppColor.borderColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select User'),
                        SizedBox(width: 10.w),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text('Type of Inspection:'),
                  SizedBox(height: 10.h),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'HUD-FHA 92051 Compliance - FINAL',
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text('Address:'),
                  SizedBox(height: 10.h),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter address'),
                  ),
                  SizedBox(height: 24.h),
                  Text('FHA Number:'),
                  SizedBox(height: 10.h),
                  TextFormField(
                    decoration: InputDecoration(hintText: '123796'),
                  ),
                  SizedBox(height: 24.h),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Created Date:'),
                            SizedBox(height: 10.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: '2025-06-07',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Completed Date:'),
                            SizedBox(height: 10.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: '2025-06-07',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),

                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  ).whenComplete(() {
    // Reset bottom sheet visibility to false after the sheet is dismissed
    ref.read(bottomSheetVisibilityProvider.notifier).state = false;
  });
}
