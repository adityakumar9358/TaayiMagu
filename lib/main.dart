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
import 'screens/delay_screen.dart';
import 'screens/monthwise_delay_screen.dart';
import 'screens/warnings.dart';
import 'screens/hb_chart_screen.dart';
import 'screens/complaints_list_screen.dart';
import 'screens/warning_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('en');

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
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(setLocale: setLocale),
        '/caretaker': (context) => const CareTakerScreen(),
        '/home': (context) => HomeScreen(setLocale: setLocale),
        '/complaints': (context) => const ComplaintScreen(),
        '/faq': (context) => const FAQScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/list': (context) => const ListScreen(),
        '/ANCdelay': (context) => const DelayScreen(),
        '/delay': (context) => const MonthwiseDelay(),
        '/warnings': (context) => const Warnings(),
        '/hbchart': (context) => const HbChart(),
        '/complaints_list': (context) => const ComplaintsList(),
        '/warning_screen': (context) => const WarningScreen(),
      },
    );
  }
}