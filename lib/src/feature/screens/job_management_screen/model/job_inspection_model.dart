import 'dart:convert';

class InspectionDetails {
  final String inspectorName;
  final String address;
  final String fhaNumber;
  final String created;
  final String completed;
  final String status;
  final String adminNote;

  InspectionDetails({
    required this.inspectorName,
    required this.address,
    required this.fhaNumber,
    required this.created,
    required this.completed,
    required this.status,
    required this.adminNote,
  });

  factory InspectionDetails.fromJson(Map<String, dynamic> json) {
    return InspectionDetails(
      inspectorName: json['inspectorName'],
      address: json['address'],
      fhaNumber: json['fhaNumber'],
      created: json['created'],
      completed: json['completed'],
      status: json['status'],
      adminNote: json['adminNote'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inspectorName': inspectorName,
      'address': address,
      'fhaNumber': fhaNumber,
      'created': created,
      'completed': completed,
      'status': status,
      'adminNote': adminNote,
    };
  }
}
class UserJobDataCall {
  static Future<List<InspectionDetails>> fetchUser(String dummyData) async {
    final decodedData = jsonDecode(dummyData);

    final listData = decodedData['data'];
    List<InspectionDetails> userJobList = (listData as List)
        .map((item) => InspectionDetails.fromJson(item))
        .toList();
    return userJobList;
  }
}
