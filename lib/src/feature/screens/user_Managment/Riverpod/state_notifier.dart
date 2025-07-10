import 'package:artneidich_admin/src/feature/screens/user_Managment/Riverpod/user_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/dummy_jsondata.dart';

final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  await Future.delayed(Duration(milliseconds: 200));

  try {
    final userJobList = await UserDataCall.fetchUser(dummyJsonData);
    return userJobList;
  } catch (error) {
    throw Exception('Error while fetching data : $error');
  }
});
