import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/color_pallete.dart';

void showAdminUpdateSheet(BuildContext context, WidgetRef ref) {
  ref.read(bottomSheetVisibilityProvider.notifier).state = true;
  final textTheme = Theme.of(context).textTheme;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 20.h),
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: IntrinsicHeight(
            child: ClipPath(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Update Admin Note",
                          style: textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Note",
                          style: textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 100.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColor.borderColor
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                               borderSide: BorderSide(
                                color: AppColor.primaryColor
                              )
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                               borderSide: BorderSide(
                                color: AppColor.error
                              )
                            ),
                            hintText: "Write here..."
                          ),
                          maxLines: 3,
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
                                onPressed: () {},
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
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 32.w,
                                    vertical: 13.h,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text("Save Note"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(() {
    ref.read(bottomSheetVisibilityProvider.notifier).state = false;
  });
}
