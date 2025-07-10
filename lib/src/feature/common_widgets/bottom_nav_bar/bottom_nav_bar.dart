import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/icons.dart';
import 'bottom_sheet_provider.dart';

class BottomNavBar extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isBottomSheetOpen = ref.watch(bottomSheetVisibilityProvider);

    return Scaffold(
      body: navigationShell,
      floatingActionButton: isBottomSheetOpen
          ? SizedBox.shrink() // Hide nav bar when bottom sheet is open
          :  ClipRRect(
        borderRadius: BorderRadius.circular(60.r),
        child: Container(
          height: 60.h,
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          decoration: BoxDecoration(
            color: Color(0xff070707),
            borderRadius: BorderRadius.circular(60.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: AppIcons.homeSolid,
                outlineIcon: AppIcons.homeOutlined,
                onTap: () => navigationShell.goBranch(0),
              ),
              _buildNavItem(
                index: 1,
                icon: AppIcons.userGroupSolid,
                outlineIcon: AppIcons.userGroupOutlined,
                onTap: () => navigationShell.goBranch(1),
              ),
              _buildNavItem(
                index: 2,
                icon: AppIcons.briefcaseSolid,
                outlineIcon: AppIcons.briefcaseOutlined,
                onTap: () => navigationShell.goBranch(2),
              ),
              _buildNavItem(
                index: 3,
                icon: AppIcons.labelSolid,
                outlineIcon: AppIcons.labelOutlined,
                onTap: () => navigationShell.goBranch(3),
              ),
              _buildNavItem(
                index: 4,
                icon: AppIcons.settingSolid,
                outlineIcon: AppIcons.settingOutlined,
                onTap: () => navigationShell.goBranch(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String outlineIcon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          15.r,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: navigationShell.currentIndex == index
              ? Colors
                    .white
              : Colors
                    .transparent,
        ),
        child: SvgPicture.asset(
          height: 24,
          width: 24,
          navigationShell.currentIndex == index ? icon : outlineIcon,
        ),
      ),
    );
  }
}
