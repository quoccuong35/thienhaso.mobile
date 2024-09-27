class ThoiKhoaBieu {
  late final String masv;
  late final DateTime ngayhoc;
  late final String ngay;
  late final String tiet;
  late final String malophocphan;
  late final String tenlophocphan;
  late final String phong;
  late final String giangvien;
  late final String loai;
  ThoiKhoaBieu(
      {required this.masv,
      required this.ngayhoc,
      required this.ngay,
      required this.tiet,
      required this.malophocphan,
      required this.tenlophocphan,
      required this.phong,
      required this.giangvien,
      required this.loai});
  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['masv'] = masv;
    _data['ngayhoc'] = ngayhoc;
    _data['ngay'] = ngay;
    _data['tiet'] = tiet;
    _data['malophocphan'] = malophocphan;
    _data['tenlophocphan'] = tenlophocphan;
    _data['phong'] = phong;
    _data['giangvien'] = giangvien;
    _data['loai'] = loai;
    return _data;
  }
}
