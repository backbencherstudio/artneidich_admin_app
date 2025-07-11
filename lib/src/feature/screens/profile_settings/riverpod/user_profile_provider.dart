import 'package:artneidich_admin/src/feature/screens/profile_settings/riverpod/user_profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user.dart';

final userProfileProvider =
    StateNotifierProvider<UserProfileProvider, UserProfileState>(
      (ref) => UserProfileProvider(),
    );

class UserProfileProvider extends StateNotifier<UserProfileState> {
  UserProfileProvider() : super(UserProfileState()) {
    _fetchUserData();
  }

   final TextEditingController nameController = TextEditingController();
   final TextEditingController userNameController= TextEditingController();
   final TextEditingController emailController= TextEditingController();
   final TextEditingController phoneController= TextEditingController();
   final TextEditingController addressController= TextEditingController();

  void _fetchUserData() {
    state = state.copyWith(
      user: User(
        fullName: "Kristin Watson",
        userName: "kristin_watson",
        email: "kristin@untitledui.com",
        phoneNumber: "(555) 123-4567",
        address: "Check Northeast Division",
      ),
    );
    nameController.text = state.user?.fullName ?? "";
    userNameController.text = state.user?.userName ?? "";
    emailController.text = state.user?.email ?? "";
    phoneController.text = state.user?.phoneNumber ?? "";
    addressController.text = state.user?.address ?? "";
  }

  /// update temporary userProfile Picture
  void updateTemporaryUserProfilePicture(XFile? userProfilePicture) {
    state = state.copyWith(temporaryUserProfilePicture: userProfilePicture);
  }
  void cancelTemporaryUserProfilePicture() {
    state = state.cancelTemporaryUserProfilePicture();
  }

  /// edit user profile
  Future<void> updateUserProfile() async {
    final User user = User(
      fullName: nameController.text.isNotEmpty ?  nameController.text : state.user?.fullName,
      userName: userNameController.text.isNotEmpty ? userNameController.text : state.user?.userName,
      email: emailController.text.isNotEmpty ?  emailController.text : state.user?.email,
      phoneNumber: phoneController.text.isNotEmpty ? phoneController.text : state.user?.phoneNumber ,
      address: addressController.text.isNotEmpty ? addressController.text : state.user?.address,
      userProfilePicture: state.temporaryUserProfilePicture ?? state.user?.userProfilePicture,
    );
    state = state.copyWith(user: user);
  }


  @override
  void dispose() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
