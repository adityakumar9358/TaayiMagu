import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/helper_functions.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Janani",
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
                      "Asha Worker", //ಆಶಾ ಕಾರ್ಯಕರ್ತೆ
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      HelperFunctions.getGreeting(),
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
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Smt Sumathi has missed her PHC appointment on 16th October 2023', //'ಶ್ರೀಮತಿ ಸುಮತಿ ಅವರು 16ನೇ ಅಕ್ಟೋಬರ್ 2023 ರಂದು ತಮ್ಮ PHC ಭೇಟಿಯನ್ನು ತಪ್ಪಿಸಿಕೊಂಡಿದ್ದಾರೆ'
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 380,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/list');
                    },
                    child: ButtonContainer(
                        icon: Icons.view_list,
                        text: 'Expectant mothers', //ನಿರೀಕ್ಷಿತ ತಾಯಂದಿರು'
                        color: Colors.deepPurple),
                  ),
                  ButtonContainer(
                      icon: Icons.alarm,
                      text: 'Warnings', //'ಎಚ್ಚರಿಕೆಗಳು'
                      color: Colors.green),
                  ButtonContainer(
                      icon: Icons.online_prediction,
                      text: 'High Risk RHID', //'ಅಪಾಯದ RHID'
                      color: Colors.orange),
                  ButtonContainer(
                      icon: Icons.help,
                      text: 'Immigrant RHID', //'ವಲಸಿಗರ RHID',
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
