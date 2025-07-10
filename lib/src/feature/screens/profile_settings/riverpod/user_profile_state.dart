import 'package:image_picker/image_picker.dart';
import '../model/user.dart';

class UserProfileState {
  final User? user;
  XFile? temporaryUserProfilePicture;
  UserProfileState({this.user, this.temporaryUserProfilePicture});
  UserProfileState copyWith({User? user, XFile? temporaryUserProfilePicture}) {
    return UserProfileState(user: user ?? this.user,
      temporaryUserProfilePicture: temporaryUserProfilePicture ?? this.temporaryUserProfilePicture,
    );
  }
  UserProfileState cancelTemporaryUserProfilePicture(){
    return UserProfileState(
      user: user,
      temporaryUserProfilePicture: null
    );
  }
}
