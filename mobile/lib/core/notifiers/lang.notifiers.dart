import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangNotifiers with ChangeNotifier {
  LangNotifiers() {
    _loadLang();
  }
  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  _loadLang() async {
    var languageCode = await getLang();
    Locale lang = const Locale('vi');

    if (languageCode != null) {
      lang = Locale(languageCode);
    }
    await setLocale(lang);
  }

  Future<String?> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppKeys.lang);
  }

  toggleLang({required String languageCode}) async {
    await saveLang(languageCode);
    Locale langLocale = Locale(languageCode);
    await setLocale(langLocale);
  }

  static Future<bool> saveLang(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(AppKeys.lang, languageCode);
  }
}
