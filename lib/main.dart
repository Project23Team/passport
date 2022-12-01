import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/pages/generalinstructions/navalpassport/view.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:myapp/pages/login/view.dart';
import 'package:myapp/pages/managerr/view.dart';
import 'package:myapp/pages/registrationDone/view.dart';
import 'package:myapp/pages/signin/view.dart';
import 'package:myapp/pages/signup/view.dart';
import 'package:myapp/pages/splash/view.dart';
import 'package:myapp/pages/tt.dart';
import 'package:myapp/pages/type_passport/newpassport/view.dart';
import 'package:myapp/pages/type_passport/renewal/view.dart';
import 'package:myapp/pages/type_passport/replacementOfLosePassport/view.dart';
import 'package:myapp/test.dart';

import 'classes/language_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home:Home(),
    );
  }
}
