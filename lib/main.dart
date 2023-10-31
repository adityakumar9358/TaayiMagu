import 'package:flutter/material.dart';
import 'package:haem_suraksha/screens/caretaker_screen.dart';
import 'package:haem_suraksha/screens/complaint_screen.dart';
import 'package:haem_suraksha/screens/faq_screen.dart';
import 'package:haem_suraksha/screens/profile_screen.dart';
import 'screens/list_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
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
      title: 'Taayi Magu',
      themeMode: ThemeMode.system,
      theme: theme,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/caretaker': (context) => CareTakerScreen(),
        '/home': (context) => HomeScreen(),
        '/complaints': (context) => ComplaintScreen(),
        '/faq': (context) => FAQScreen(),
        '/profile': (context) => ProfileScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}
