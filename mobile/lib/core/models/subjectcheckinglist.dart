import 'package:intl/intl.dart';

class SubjectCheckingList {
  late final int classSubjectID;
  late final String? date;
  late final double? permissionQuantity;
  late final double? noPermissionQuantity;
  late final String? description;

  SubjectCheckingList.fromJson(Map<String, dynamic> json) {
    classSubjectID = json['ClassSubjectID'];
    date = DateFormat('dd/MM/yyyy').format(DateTime.parse(json['Date']));
    permissionQuantity = json['PermissionQuantity'];
    noPermissionQuantity = json['NoPermissionQuantity'];
    description = json['Description'];
  }
}
