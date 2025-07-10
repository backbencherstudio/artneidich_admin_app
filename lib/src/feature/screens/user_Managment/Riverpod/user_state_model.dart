import 'dart:convert';

class UserModel {
  final int index;
  final String userName;
  final String email;
  final String phoneNumber;
  final String role;

  UserModel({
    required this.index,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      index: json['index'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }

}

class UserDataCall {
  static Future<List<UserModel>> fetchUser(String dummyData) async {
    final decodedData = jsonDecode(dummyData);

    final listData = decodedData['data'];
    List<UserModel> userJobList = (listData as List)
        .map((item) => UserModel.fromJson(item))
        .toList();
    return userJobList;
  }
}
