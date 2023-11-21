import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              Image.asset('images/logo.png', width: 300),
              SizedBox(height: 50),
              Text("ಸುಲಲಿತ ಆರೈಕೆ",
                  style: TextStyle(fontSize: 32), textAlign: TextAlign.left),
              Text(
                "ನಿಮ್ಮ ಪ್ರಯಾಣ, ನಮ್ಮ ಕಾಳಜಿ",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 25),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'ಪ್ರಾರಂಭಿಸಿ',
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
