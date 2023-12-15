import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/caretaker_screen.dart';
import 'screens/complaint_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/list_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  final ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Raleway',
    brightness: Brightness.light,
    colorSchemeSeed: Colors.lightBlue,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Janani',
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('ka')],
      theme: theme,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(setLocale: setLocale),
        '/caretaker': (context) => CareTakerScreen(),
        '/home': (context) => HomeScreen(setLocale: setLocale),
        '/complaints': (context) => ComplaintScreen(),
        '/faq': (context) => FAQScreen(),
        '/profile': (context) => ProfileScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}
