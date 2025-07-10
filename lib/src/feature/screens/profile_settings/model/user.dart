import 'package:image_picker/image_picker.dart';

class User{
   XFile? userProfilePicture;
   String? fullName;
   String? userName;
   String? email;
   String? phoneNumber;
   String? address;
   User({this.userProfilePicture,this.fullName,this.userName,this.email,this.phoneNumber,this.address});
}