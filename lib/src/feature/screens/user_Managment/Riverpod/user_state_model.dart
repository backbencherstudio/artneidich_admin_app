import 'dart:convert';

class UserStateModel {
  final int index;
  final String userName;
  final String email;
  final String phoneNumber;
  final String role;

  UserStateModel({
    required this.index,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory UserStateModel.fromJson(Map<String, dynamic> json) {
    return UserStateModel(
      index: json['index'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }
}

class UserDataModel {
  final List<UserStateModel> data;

  UserDataModel({required this.data});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<UserStateModel> userList = list.map((i) => UserStateModel.fromJson(i)).toList();
    return UserDataModel(data: userList);
  }

  // Fetch users from the dummy data
  static List<UserStateModel> fetchUser(String dummyData) {
    // Decode the JSON string (dummy data)
    final Map<String, dynamic> decodedData = jsonDecode(dummyData);
    
    // Parse the 'data' key, which contains the list of users
    var list = decodedData['data'] as List;
    return list.map((i) => UserStateModel.fromJson(i)).toList();
  }
}
