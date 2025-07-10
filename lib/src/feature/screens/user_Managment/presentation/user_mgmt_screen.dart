import 'package:artneidich_admin/src/core/constant/padding.dart';
import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:artneidich_admin/src/feature/common_widgets/commonWidget.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_details_tile.dart';
import 'package:artneidich_admin/src/feature/screens/user_Managment/Riverpod/state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';

class UserMgmtScreen extends StatelessWidget {
  const UserMgmtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            CommonWidget.appBar(title: "User List"),
            SizedBox(height: 16.h),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: SvgPicture.asset(AppIcons.search),
                ),
              ),
            ),

        Consumer(
              builder: (_, ref, _) {
                debugPrint('\ncalling user data \n');
                final userData = ref.watch(userListProvider);

                return userData.when(
                  data: (userData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: userData.length,
                        itemBuilder: (_, index) {
                          final user = userData[index];
                          return CustomDetailsTile(
                            email: user.email,
                            index: user.index,
                            phoneNumber: user.phoneNumber,
                            role: user.role,
                            userName: user.userName,
                          );
                        },
                      ),
                    );
                  },
                  error: (error, stack) => Center(child: Text('Failed to load data')),
                  loading: () => Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: 98.w,
          height: 60.h,
          child: FloatingActionButton(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16.r),
            ),
            backgroundColor: AppColor.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.add), Text("Add")],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
