// ignore_for_file: empty_constructor_bodies

class DiemHocPhan {
  late final String mamon;
  late final String tenmon;
  late final String tc;
  late final String d10;
  late final String hs1;
  late final String hs2;
  late final String tbkt;
  late final String thi1;
  late final String thi2;
  late final String thi3;
  late final String tkm1;
  late final String tkm2;
  late final String tkm3;
  late final String tongketmon;
  late final String diemchu;
  DiemHocPhan({
    required this.mamon,
    required this.tenmon,
    required this.tc,
    required this.d10,
    required this.hs1,
    required this.hs2,
    required this.tbkt,
    required this.thi1,
    required this.thi2,
    required this.thi3,
    required this.tkm1,
    required this.tkm2,
    required this.tkm3,
    required this.tongketmon,
    required this.diemchu,
  });
}

class DiemChiTiet {
  late final String masv;
  late final String hocky;
  late final List<DiemHocPhan> diemhocphams;
  DiemChiTiet(
      {required this.masv, required this.hocky, required this.diemhocphams});
}
