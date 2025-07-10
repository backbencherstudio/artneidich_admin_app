import 'package:artneidich_admin/src/feature/screens/profile_settings/edit_profile_screen/presentation/widgets/profile_picture/edit_profile_form.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/edit_profile_screen/presentation/widgets/profile_picture/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/padding.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../riverpod/user_profile_provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer(
      builder: (_, ref, _) {
        return PopScope(
          onPopInvokedWithResult: (bool shouldPop, result){
            ref.read(userProfileProvider.notifier).cancelTemporaryUserProfilePicture();
          },
          // onPop: () async {
          //   ref.read(userProfileProvider.notifier).cancelTemporaryUserProfilePicture();
          //   return true;
          // },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: AppColor.profileTextColor,
                ),
              ),
              title: Text(
                "Edit Profile",
                style: textTheme.titleSmall?.copyWith(
                  color: AppColor.profileTextColor,
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: AppPadding.horizontalPadding,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      ProfilePicturePicker(),
                      SizedBox(height: 40.h),
                      EditProfileForm(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
