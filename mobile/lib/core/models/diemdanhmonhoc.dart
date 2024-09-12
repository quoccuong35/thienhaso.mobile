class DiemDanhMonHoc {
  late final String masv;
  late final String malophocphan;
  late final String tenlophocphan;
  late final String giaovien;
  late final String sogio;
  late final String tc;
  late final String tonggiovang;
  late final String camthi;
  late final String ghichu;
  late final List<DiemDanhChiTiet>? diemdanhchitiet;
  DiemDanhMonHoc(
      {required this.masv,
      required this.malophocphan,
      required this.tenlophocphan,
      required this.giaovien,
      required this.tc,
      required this.sogio,
      required this.tonggiovang,
      required this.camthi,
      required this.ghichu,
      this.diemdanhchitiet});
}

class DiemDanhChiTiet {
  late final String ngayvang;
  late final String trangthai;
  late final String tiethienhanh;
  late final String sotietvang;
  DiemDanhChiTiet(
      {required this.ngayvang,
      required this.trangthai,
      required this.tiethienhanh,
      required this.sotietvang});
}
