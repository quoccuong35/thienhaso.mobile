import 'package:mobile/core/models/objresult.dart';

class SubjectMarkOfSemester {
  late final int yearID;
  late final int semester;
  late final int orderIndex;
  late final List<ObjResult> fields;

  SubjectMarkOfSemester.fromJson(Map<String, dynamic> json) {
    yearID = json['yearID'];
    semester = json['semester'];
    orderIndex = json['orderIndex'];
    fields =
        List.from(json['fields']).map((e) => ObjResult.fromJson(e)).toList();
  }
}
