import 'package:artneidich_admin/src/feature/screens/profile_settings/profile_settings_screen/presentation/widgets/account_settings_card.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/profile_settings_screen/presentation/widgets/log_out_card/log_out_card.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/profile_settings_screen/presentation/widgets/preferences_card.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/profile_settings_screen/presentation/widgets/user_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/padding.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF6F8FA),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Settings",
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                UserDetailsCard(),
                // SizedBox(height: 16.h),
                // PreferencesCard(),
                SizedBox(height: 16.h),
                AccountSettingsCard(),
                SizedBox(height: 30.h),
                LogOutCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
