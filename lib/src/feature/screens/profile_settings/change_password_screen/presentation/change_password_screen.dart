import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  late final FocusNode currentPasswordFocusNode;
  late final FocusNode newPasswordFocusNode;
  late final FocusNode confirmPasswordFocusNode;

  @override
  void initState() {
    currentPasswordController = TextEditingController(text: "********");
    newPasswordController = TextEditingController(text: "********");
    confirmPasswordController = TextEditingController(text: "********");
    currentPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.profileTextColor,
          ),
        ),
        title: Text(
          "Change Password",
          style: textTheme.titleSmall?.copyWith(
            color: AppColor.profileTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              SizedBox(height: 16.h),
              TextFormField(
                obscureText: true,
                controller: currentPasswordController,
                focusNode: currentPasswordFocusNode,
                onTapOutside: (_) => currentPasswordFocusNode.unfocus(),
                onEditingComplete: () => currentPasswordFocusNode.nextFocus(),
                decoration: InputDecoration(labelText: "Current Password"),
              ),
              TextFormField(
                obscureText: true,
                controller: newPasswordController,
                focusNode: newPasswordFocusNode,
                onTapOutside: (_) => newPasswordFocusNode.unfocus(),
                onEditingComplete: () => newPasswordFocusNode.nextFocus(),
                decoration: InputDecoration(labelText: "New Password"),
              ),
              TextFormField(
                obscureText: true,
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocusNode,
                onTapOutside: (_) => confirmPasswordFocusNode.unfocus(),
                onEditingComplete: () => confirmPasswordFocusNode.nextFocus(),
                decoration: InputDecoration(labelText: "Confirm Password"),
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
                      onPressed: ()=>context.pop(),
                      child: Text("Cancel"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=>context.pop(),
                      child: Text("Update"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
