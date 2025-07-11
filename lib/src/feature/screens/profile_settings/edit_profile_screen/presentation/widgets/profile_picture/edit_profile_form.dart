import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../../riverpod/user_profile_provider.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  // late final TextEditingController nameController;
  // late final TextEditingController userNameController;
  // late final TextEditingController emailController;
  // late final TextEditingController phoneController;

  late final FocusNode nameFocusNode;
  late final FocusNode userNameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode phoneFocusNode;
  late final FocusNode addressFocusNode;

  @override
  void initState() {
    // nameController = TextEditingController();
    // userNameController = TextEditingController();
    // emailController = TextEditingController();
    // phoneController = TextEditingController();
    nameFocusNode = FocusNode();
    userNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    super.initState();
  }

  @override
  dispose() {
    // nameController.dispose();
    // userNameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    nameFocusNode.dispose();
    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    addressFocusNode.dispose();
    super.dispose();
  }

  Widget _customTextField({
    required String labelText,
    required String hintText,
    required FocusNode focusNode,
    required TextEditingController textEditingController,
  }) {
    return TextFormField(
      focusNode: focusNode,
      controller: textEditingController,
      onEditingComplete: () => focusNode.nextFocus(),
      onTapOutside: (_) => focusNode.unfocus(),
      decoration: InputDecoration(labelText: labelText, hintText: hintText),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer(
      builder: (_, ref, _) {
        // final userProfileState = ref.watch(userProfileProvider);
        final userProfileNotifier = ref.read(userProfileProvider.notifier);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            Text(
              "About you",
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            _customTextField(
              labelText: "Name",
              hintText: "Your Name",
              textEditingController: userProfileNotifier.nameController,
              focusNode: nameFocusNode,
            ),
            _customTextField(
              labelText: "Username",
              hintText: "Your username",
              textEditingController: userProfileNotifier.userNameController,
              focusNode: userNameFocusNode,
            ),
            _customTextField(
              labelText: "Email",
              hintText: "Your email",
              textEditingController: userProfileNotifier.emailController,
              focusNode: emailFocusNode,
            ),
            _customTextField(
              labelText: "Phone",
              hintText: "Your phone number",
              textEditingController: userProfileNotifier.phoneController,
              focusNode: phoneFocusNode,
            ),
            _customTextField(
              labelText: "Phone",
              hintText: "Your phone number",
              textEditingController: userProfileNotifier.addressController,
              focusNode: addressFocusNode,
            ),
            SizedBox(height: 48.h),
            Row(
              spacing: 8.w,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffECEFF3),
                      foregroundColor: AppColor.profileTextColor,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text("cancel"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      userProfileNotifier.updateUserProfile();
                      context.pop();
                    },
                    child: Text("Update"),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
