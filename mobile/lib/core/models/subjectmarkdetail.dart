import 'package:mobile/core/models/objresult.dart';

class SubjectMarkDetail {
  late final int yearID;
  late final int semester;
  late final int orderIndex;
  late final List<SubjectMark> subjectMarks;
  SubjectMarkDetail.fromJson(Map<String, dynamic> json) {
    yearID = json['yearID'];
    semester = json['semester'];
    orderIndex = json['orderIndex'];
    subjectMarks = List.from(json['subjectMarks'])
        .map((e) => SubjectMark.fromJson(e))
        .toList();
  }
}

class SubjectMark {
  late final String subjectID;
  late final String subjectName;
  late final int unitText;
  late final dynamic finalSummary;
  late final int orderIndex;
  late final List<ObjResult> fields;
  SubjectMark.fromJson(Map<String, dynamic> json) {
    subjectID = json['subjectID'];
    subjectName = json['subjectName'];
    orderIndex = json['orderIndex'];
    unitText = json['unitText'];
    finalSummary = json['finalSummary'];
    fields =
        List.from(json['fields']).map((e) => ObjResult.fromJson(e)).toList();
  }
}
