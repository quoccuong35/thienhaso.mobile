class BangDiemToanKhoa {
  late final String masv;
  late final String nienkhoa;
  late final String lophoc;
  late final String nganhnghe;
  late final String trinhdodaotao;
  late final String tongsotc;
  late final String tongsotctichluy;
  late final String xeploaihoctap;
  late final String tbctlhe10;
  late final String tbctlhe4;
  late final String tbctnhe10;
  late final String tbctnhe4;
  late final String xeploaitotnghiep;

  BangDiemToanKhoa(
      {required this.masv,
      required this.nienkhoa,
      required this.lophoc,
      required this.nganhnghe,
      required this.trinhdodaotao,
      required this.tongsotc,
      required this.tongsotctichluy,
      required this.xeploaihoctap,
      required this.tbctlhe10,
      required this.tbctlhe4,
      required this.tbctnhe10,
      required this.tbctnhe4,
      required this.xeploaitotnghiep});
  BangDiemToanKhoa.enty();

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['masv'] = masv;
    _data['nienkhoa'] = nienkhoa;
    _data['lophoc'] = lophoc;
    _data['nganhnghe'] = nganhnghe;
    _data['trinhdodaotao'] = trinhdodaotao;
    _data['tongsotc'] = tongsotc;
    _data['tongsotctichluy'] = tongsotctichluy;
    _data['xeploaihoctap'] = xeploaihoctap;
    _data['tbctlhe10'] = tbctlhe10;
    _data['tbctlhe4'] = tbctlhe4;
    _data['tbctnhe10'] = tbctnhe10;
    _data['tbctnhe4'] = tbctnhe4;
    _data['xeploaitotnghiep'] = xeploaitotnghiep;
    return _data;
  }
}
