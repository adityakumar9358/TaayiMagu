import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/button_container.dart';

class CareTakerScreen extends StatefulWidget {
  CareTakerScreen({super.key});

  @override
  State<CareTakerScreen> createState() => _CareTakerScreenState();
}

class _CareTakerScreenState extends State<CareTakerScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    String _message = "";
    DateTime now = DateTime.now();
    String _currentHour = DateFormat('kk').format(now);
    int hour = int.parse(_currentHour);

    setState(
      () {
        if (hour >= 5 && hour < 12) {
          _message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          _message = 'Good Afternoon';
        } else {
          _message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sulalitha Aaraiyke",
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Care Taker",
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      _message,
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.person),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Mrs Sumathi has missed her PHC visit due on 16th October 2023 ',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 380,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: <Widget>[
                  ButtonContainer(
                      icon: Icons.view_list,
                      text: 'List of All Patients',
                      color: Colors.deepPurple),
                  ButtonContainer(
                      icon: Icons.alarm, text: 'Warning', color: Colors.green),
                  ButtonContainer(
                      icon: Icons.online_prediction,
                      text: 'High Risk RHID',
                      color: Colors.orange),
                  ButtonContainer(
                      icon: Icons.help,
                      text: 'Migrants RHID',
                      color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
