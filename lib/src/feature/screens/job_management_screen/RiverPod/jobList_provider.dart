import 'package:artneidich_admin/src/feature/screens/job_management_screen/model/dummy_json_job_model.dart';
import 'package:artneidich_admin/src/feature/screens/job_management_screen/model/job_inspection_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userJobListProvider = FutureProvider<List<InspectionDetails>>((ref) async {
  await Future.delayed(Duration(milliseconds: 200));

  try {
    final jobList = await UserJobDataCall.fetchUser(dummyJobJsonData);
    return jobList;
  } catch (error) {
    throw Exception('Error while fetching data : $error');
  }
});
