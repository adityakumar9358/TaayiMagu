import 'package:flutter/material.dart';

import '../widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  labelText: 'Username', //'ಬಳಕೆದಾರ ಹೆಸರು',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password', //'ಗುಪ್ತಪದ',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password', //'ಗುಪ್ತಪದ ಮರೆತಿರಾ?',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); //caretaker
                },
                child: Text(
                  'Login', //'ಲಾಗಿನ್ ಮಾಡಿ',
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
