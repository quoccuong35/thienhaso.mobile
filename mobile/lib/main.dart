// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
import 'package:provider/provider.dart';

import 'app/constants/app.keys.dart';
import 'app/constants/app.theme.dart';
import 'app/providers/app.provider.dart';
import 'app/routers/app.routes.dart';
import 'core/notifiers/theme.notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const ThienHaSo());
  });
}

class ThienHaSo extends StatelessWidget {
  const ThienHaSo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const Core(),
    );
  }
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier, LangNotifiers>(
      builder: (context, notifier, lang, _) {
        return MaterialApp(
          title: AppKeys.title,
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          // locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('vi'), // English
            Locale('en'), // Spanish
          ],
          // supportedLocales: AppLocalization.all,
          //theme: notifier.darkTheme ? darkTheme : lightTheme,
          locale: lang.locale,
          theme: darkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.splashRoute,
        );
      },
    );
  }
}
