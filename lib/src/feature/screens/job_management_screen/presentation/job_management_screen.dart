import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_job_detail_tile.dart';
import 'package:artneidich_admin/src/feature/screens/job_management_screen/RiverPod/jobList_provider.dart';
import 'package:artneidich_admin/src/feature/screens/user_Managment/presentation/widgets/add_user_bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/constant/padding.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/commonWidget.dart';

class JobManagementScreen extends ConsumerWidget {
  const JobManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            CommonWidget.appBar(title: "Job List"),
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
                final userData = ref.watch(userJobListProvider);

                return userData.when(
                  data: (userData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: userData.length,
                        itemBuilder: (_, index) {
                          final user = userData[index];

                          return Padding(
                            padding: EdgeInsets.only(bottom: 11.h),
                            child: CustomJobDetailTile(
                              index: index,
                              inspectorName: user.inspectorName,
                              address: user.address,
                              fhaNumber: user.fhaNumber,
                              createdAt: user.created,
                              completedAt: user.completed,
                              status: user.status,
                              adminNote: user.adminNote,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  error: (error, stack) =>
                      Center(child: Text('Failed to load data')),
                  loading: () => Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 100.h),

        child: Padding(
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
              onPressed: () async {
                showCreateNewUserSheet(context, ref);
              },
            ),
          ),
        ),
      ),
    );
  }
}
