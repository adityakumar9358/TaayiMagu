import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  final Function(Locale) setLocale;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key, required this.setLocale});

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.key21), // 'Login'
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              // Toggle between 'en' and 'ka'
              if (Localizations.localeOf(context).languageCode == 'en') {
                setLocale(Locale('ka'));
              } else {
                setLocale(Locale('en'));
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Image.asset(
                'images/logo.png',
                width: 200,
              ),
              SizedBox(height: 50),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: localizations.key18, // 'Username'
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: localizations.key19, // 'Password'
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    localizations.key20, // 'Forgot Password'
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); //caretaker
                },
                child: Text(
                  localizations.key21, // 'Login'
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
