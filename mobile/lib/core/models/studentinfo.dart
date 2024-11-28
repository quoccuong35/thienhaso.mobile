class StudentInfo {
  late int? studentID; // ID sinh viên (id hệ thống)
  late String? studentCode; // Mã HSSV
  late String? fullName; // Họ tên

  late int? birthDay;
  late int? birthMonth;
  late int? birthYear;
  late String? birthDateText; // Ngày sinh dạng string
  late String? birthPlace; // Nơi sinh

  late String? tel;
  late String? contactTel; // Đt liên lạc (của phụ huynh)
  late String? email;
  late String? facebook;
  late String? liveAddress; // Hộ khẩu thường trú

  late String? classID; // Mã lớp
  late String? className; // Tên lớp
  late String? courseName; // Niên khóa
  late String? specialBranchName; // Ngành nghề

  late DateTime? createdDate;

  late String? avatarUrl;

  StudentInfo({
    required this.studentID,
    required this.studentCode,
    required this.fullName,
    required this.birthDay,
    required this.birthMonth,
    required this.birthYear,
    required this.birthDateText,
    required this.birthPlace,
    required this.tel,
    required this.contactTel,
    required this.email,
    required this.facebook,
    required this.liveAddress,
    required this.classID,
    required this.className,
    required this.courseName,
    required this.specialBranchName,
  });
  StudentInfo.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'] ?? "";
    studentCode = json['studentCode'] ?? "";
    fullName = json['fullName'] ?? "";
    birthDay = json['birthDay'] ?? "";
    birthMonth = json['birthMonth'] ?? "";
    birthYear = json['birthYear'] ?? "";
    birthDateText = json['birthDateText'] ?? "";
    birthPlace = json['birthPlace'] ?? "";
    tel = json['tel'] ?? "";
    contactTel = json['contactTel'] ?? "";
    email = json['email'] ?? "";
    facebook = json['facebook'] ?? "";
    liveAddress = json['liveAddress'] ?? "";
    classID = json['classID'] ?? "";
    className = json['className'] ?? "";
    courseName = json['courseName'] ?? "";
    specialBranchName = json['specialBranchName'] ?? "";
    avatarUrl = json['avatarUrl'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['studentID'] = studentID;
    data['studentCode'] = studentCode;
    return data;
  }

  void setEmty() {
    studentID = null;
    studentCode = null;
    fullName = null;
    birthDay = null;
    birthMonth = null;
    birthYear = null;
    birthDateText = null;
    birthPlace = null;
    tel = null;
    contactTel = null;
    email = null;
    facebook = null;
    liveAddress = null;
    classID = null;
    className = null;
    courseName = null;
    specialBranchName = null;
  }
}
