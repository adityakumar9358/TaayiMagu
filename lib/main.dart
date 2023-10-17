import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taayi Magu',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Raleway',
        brightness: Brightness.light,
        colorSchemeSeed: Colors.lightBlue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Raleway',
        colorSchemeSeed: Colors.lightBlue,
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
