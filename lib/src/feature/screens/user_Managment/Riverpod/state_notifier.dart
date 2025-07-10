import 'package:artneidich_admin/src/feature/screens/user_Managment/Riverpod/user_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/dummy_data/job_data.dart';

final userListProvider = FutureProvider<List<UserStateModel>>((ref) async {
  await Future.delayed(Duration(milliseconds: 200)); // Simulate network delay
  
  // Call the static fetchUser method, passing the dummyJobData as an argument
  return UserDataModel.fetchUser(dummyJobData);
});
