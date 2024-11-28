import 'package:intl/intl.dart';

class ScheduleList {
  late final String? date;
  late final int? session; //0:sáng, 1. chiều, 2. tối
  late final String? subjectID; // mã môn
  late final String? roomID; // mã phòng
  late final String? teacherID;
  late final int? fromLessionTime; // Từ tiết
  late final int? toLessionTime; // đến tiết
  late final String?
      statusText; // string trạng thái của tiết: Dạy bù | Báo nghỉ | ...
  late final String? teacherName; // Tên gv
  late final String? subjectName; // tên môn
  late final int? isTestSchedule; // loại lịch: 0_Lịch học; 1_ Lịch thi

  ScheduleList.fromJson(Map<String, dynamic> json) {
    date = DateFormat('dd/MM/yyyy').format(DateTime.parse(json['Date']));
    session = json['Session'];
    subjectID = json['SubjectID'];
    roomID = json['RoomID'];
    teacherID = json['TeacherID'];
    fromLessionTime = json['FromLessionTime'];
    toLessionTime = json['ToLessionTime'];
    statusText = json['StatusText'];
    teacherName = json['TeacherName'];
    subjectName = json['SubjectName'];
    isTestSchedule = json['IsTestSchedule'];
  }
}
