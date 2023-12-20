import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const ButtonContainer(
      {super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30), // Increased roundness of edges
      ),
      padding: const EdgeInsets.all(7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 55.0, color: Colors.white), // Increased icon size
          const SizedBox(height: 6.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20.0, // Increased font size
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
