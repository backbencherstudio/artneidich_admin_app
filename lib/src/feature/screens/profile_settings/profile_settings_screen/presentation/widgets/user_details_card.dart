import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/constant/images.dart';
import '../../../../../../core/routes/route_constant.dart';
import '../../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../riverpod/user_profile_provider.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({super.key});

  Widget _customTile({
    required String leadingIconPath,
    required String text,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.w,
      children: [
        SvgPicture.asset(leadingIconPath),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColor.profileTextColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10.w,
            children: [
              Consumer(
                builder: (_, ref, _) {
                  final userProfilePicture = ref
                      .watch(userProfileProvider)
                      .user
                      ?.userProfilePicture;
                  return userProfilePicture != null
                      ? ClipOval(child: Image.file(File(userProfilePicture.path),
                    width: 46.w,
                    height: 46.w,
                    fit: BoxFit.cover,
                  ),)
                      : Image.asset(
                          AppImages.profilePicture,
                          width: 46.w,
                          height: 46.w,
                        );
                },
              ),
              Expanded(
                child: Consumer(
                    builder: (_, ref, _) {
                      final userProfileState = ref
                          .watch(userProfileProvider);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2.h,
                      children: [
                        Text(
                          userProfileState.user?.fullName ?? "Kristin Watsons",
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          userProfileState.user?.email ??  "kristin@untitledui.com",
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColor.secondaryTextColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  }
                ),
              ),
             // Spacer(),
              SizedBox(width: 10.w,),
              GestureDetector(
                onTap: () => context.push(RouteConst.editProfileScreen),
                child: SvgPicture.asset(AppIcons.editIcon),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Consumer(
              builder: (_, ref, _) {
                final userPhoneNumber = ref
                    .watch(userProfileProvider).user?.phoneNumber;
              return _customTile(
                leadingIconPath: AppIcons.call,
                text: userPhoneNumber ??  "(555) 123-123",
                textTheme: textTheme,
              );
            }
          ),
          Consumer(
              builder: (_, ref, _) {
                final userAddress = ref
                    .watch(userProfileProvider).user?.address;
              return _customTile(
                leadingIconPath: AppIcons.city,
                text: userAddress ??  "Check Northeast Division",
                textTheme: textTheme,
              );
            }
          ),
        ],
      ),
    );
  }
}
