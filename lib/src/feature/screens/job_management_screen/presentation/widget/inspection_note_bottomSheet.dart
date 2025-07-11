import 'package:artneidich_admin/src/core/constant/icons.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showInspectionNoteSheet(BuildContext context, WidgetRef ref) {
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





                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          SizedBox(),
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

                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(AppIcons.crossIcon,
                            height: 20.h,
                            width: 20.w,
                            ))
                        ],
                      ),




                      SizedBox(height: 18.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Inspection note",
                          style: textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColor.borderColor,
                          )
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Note:",
                                  style: textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryTextColor,
                                  ),
                                  ),
                                  Spacer(),
                                  Text("9:33 AM",
                                   style: textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.secondaryTextColor,
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h,),
                              Text("All is super good. All is super good. All is super good...",
                                 style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryTextColor,
                                  ),
                              )
                            ],
                          ),
                        ),
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
