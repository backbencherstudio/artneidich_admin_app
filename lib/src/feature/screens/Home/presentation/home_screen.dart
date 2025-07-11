import 'package:artneidich_admin/src/core/constant/padding.dart';
import 'package:artneidich_admin/src/core/routes/route_constant.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_details_tile.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_info_tile.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/widgets/custom_job_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        leadingWidth: 56.w,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: textTheme.titleSmall!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.textColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "Beginner Roay",
              style: textTheme.titleSmall!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.greyTextColor,
              ),
            ),
          ],
        ),
        leading: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(AppImages.wprofilepic, height: 48.h, width: 48.w),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.surfaceColor,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppIcons.bell),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(height: 16.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Project status",
                  style: textTheme.titleMedium!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  CustomInfoTile(
                    count: '12',
                    lebel: 'TotaI User',
                    icon: AppIcons.group,
                    color: Color(0xffEFF8FF),
                  ),
                  SizedBox(width: 12.w),
                  CustomInfoTile(
                    count: '7',
                    lebel: 'Total Job',
                    icon: AppIcons.checklist,
                    color: Color(0xffFFF6EF),
                  ),
                  SizedBox(width: 12.w),
                  CustomInfoTile(
                    count: '29',
                    lebel: 'Tolal Label',
                    icon: AppIcons.bookMark,
                    color: Color(0xffF8EEFB),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "User List",
                      style: textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.push(RouteConst.userMgmScreen);
                      // to show all list
                    },
                    child: Text(
                      "See all",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff328B7F),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff328B7F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomDetailsTile(
             
                index: 1,
                userName: 'Artneidich',
                email: 'art@artneidich.com',
                phoneNumber: '+00-1237896',
                role: 'Inspector',
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Job List",
                      style: textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // to show all list
                    },
                    child: Text(
                      "See all",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff328B7F),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff328B7F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomJobDetailTile(
                index: 2,
                inspectorName: 'Artneidich',
                address: '2025, ITC Business Hub',
                fhaNumber: '123796',
                createdAt: '2025-06-07 14:1 8',
                completedAt: '2025-06-07 14:1 8',
                status: 'In progress',
                adminNote: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
