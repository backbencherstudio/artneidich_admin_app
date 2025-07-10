import 'dart:convert';
import 'package:artneidich_admin/src/feature/screens/user_Managment/Riverpod/user_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/dummy_jsondata.dart';

final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  //await Future.delayed(Duration(milliseconds: 200)); // Simulate network delay

  try{
    // final decodedData = jsonDecode(dummyJobData);
    // final listData = decodedData['data'];
    // debugPrint("\ndecoded data : $listData\n");
    // // return list.map((i) => UserStateModel.fromJson(i)).toList();
    // List<UserModel> userJobList = (listData as List).map((item)=>UserModel.fromJson(item)).toList();
    // debugPrint("\nuser job list : \n${userJobList.toString()}\n");

    final userJobList = await UserDataCall.fetchUser(dummyJobData);
    return userJobList;
  }catch(error){
    throw Exception('Error while fetching data : $error');
  }

  // Call the static fetchUser method, passing the dummyJobData as an argument
  //return UserDataModel.fetchUser(dummyJobData);
});
