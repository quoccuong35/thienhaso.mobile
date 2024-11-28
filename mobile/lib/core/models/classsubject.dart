class ClassSubject {
  late final int? classSubjectID;
  late final int? yearID;
  late final int? semester;
  late final int? unitText;
  late final String? subjectID;
  late final String? subjectName;
  late final String? teacherName;
  late final int? orderLearning;
  late final double? finalSummary;
  late final double? offQuantityTotal;
  late final int? totalQuantity;
  late final double? percentOff;
  late final String? allowExamDescription;
  ClassSubject.fromJson(Map<String, dynamic> json) {
    classSubjectID = json['ClassSubjectID'];
    yearID = json['YearID'];
    semester = json['Semester'];
    unitText = json['UnitText'];
    subjectID = json['SubjectID'];
    subjectName = json['SubjectName'];
    teacherName = json['TeacherName'];
    orderLearning = json['OrderLearning'];
    finalSummary = json['FinalSummary'];
    offQuantityTotal = json['OffQuantityTotal'];
    totalQuantity = json['TotalQuantity'];
    percentOff = json['PercentOff'];
    allowExamDescription = json['AllowExamDescription'];
  }
}
