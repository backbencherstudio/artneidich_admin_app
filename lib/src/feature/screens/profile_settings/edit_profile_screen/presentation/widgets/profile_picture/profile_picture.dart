import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../riverpod/user_profile_provider.dart';

class ProfilePicturePicker extends StatelessWidget {
  const ProfilePicturePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 75.w,
        height: 75.w,
        child: Consumer(
          builder: (_, ref, _) {
            final userProfileState = ref.watch(userProfileProvider);
            return GestureDetector(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? pickedImage = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedImage != null) {
                  ref
                      .read(userProfileProvider.notifier)
                      .updateTemporaryUserProfilePicture(pickedImage);
                }
              },
              child: userProfileState.temporaryUserProfilePicture != null
                  ? ClipOval(
                      child: Image.file(
                        File(
                          userProfileState.temporaryUserProfilePicture!.path,
                        ),
                        fit: BoxFit.cover,
                      ),
                    )
                  : userProfileState.user!.userProfilePicture != null
                  ? ClipOval(
                      child: Image.file(
                        File(userProfileState.user!.userProfilePicture!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : SvgPicture.asset(AppIcons.imagePicker, fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
