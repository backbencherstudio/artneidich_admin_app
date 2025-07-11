import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';
import 'package:artneidich_admin/src/feature/screens/user_Managment/presentation/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/color_pallete.dart';

void showCreateNewUserSheet(BuildContext context, WidgetRef ref) {
  final textTheme = Theme.of(context).textTheme;
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController roleController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
  ref.read(bottomSheetVisibilityProvider.notifier).state = true;

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
                          "Create New User",
                          style: textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextForm(title: 'Name', controller: nameController),
                      SizedBox(height: 16.h),
                      CustomTextForm(title: 'Email:', controller: emailController),
                      SizedBox(height: 16.h),
                      CustomTextForm(title: 'Phone number', controller: phoneController),
                      SizedBox(height: 16.h),
                      CustomTextForm(title: 'Role', controller: roleController),
                      SizedBox(height: 16.h),
                      CustomTextForm(title: 'Password:', controller: passwordController),
                      SizedBox(height: 16.h),
                      CustomTextForm(title: 'Confirm Password:', controller: confirmPasswordController),
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
                                                child: Text("Cancel",
                                                style: textTheme.bodyLarge!.copyWith(
                                                  color: AppColor.primaryTextColor
                                                ),
                                                ),
                                              ),
                                            ),
                          ),
            SizedBox(width: 12.w,),
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
                      child: Text("Submit"),
                    ),
                                   ),
                 ),
                      ],
                     )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete((){
      ref.read(bottomSheetVisibilityProvider.notifier).state = false;

  });
}
