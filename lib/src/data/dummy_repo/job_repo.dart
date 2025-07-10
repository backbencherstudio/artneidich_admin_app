import 'dart:convert';
import 'package:artneidich_admin/src/data/models/job_model.dart';
import '../../feature/screens/user_Managment/model/dummy_jsondata.dart';

class JobRepo{
  Future<List<Job>> fetchJobs() async {
    await Future.delayed(Duration(milliseconds: 300));
    List<dynamic> jobDataJson = jsonDecode(dummyJobData);
    return jobDataJson.map((data) => Job.fromJson(data)).toList();
  }
}