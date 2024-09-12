import 'package:mobile/core/notifiers/bangdiem.notifier.dart';
import 'package:mobile/core/notifiers/diemdanh.notifier.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
import 'package:mobile/core/notifiers/sinhvien.notifier.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../core/notifiers/authentication.notifer.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => BangDiemNotifier()),
    ChangeNotifierProvider(create: (_) => SinhVienNotifier()),
    ChangeNotifierProvider(create: (_) => DiemDanhNotifier()),
    ChangeNotifierProvider(create: (_) => LangNotifiers()),
  ];
}
