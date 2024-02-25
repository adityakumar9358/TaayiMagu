import 'package:flutter/material.dart';

import '../utils/helper_functions.dart';
import '../widgets/button_container.dart';

class CareTakerScreen extends StatefulWidget {
  const CareTakerScreen({super.key});

  @override
  State<CareTakerScreen> createState() => _CareTakerScreenState();
}

class _CareTakerScreenState extends State<CareTakerScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    String message = "";

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
            SizedBox(
              width: double.infinity,
              height: 550,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/list');
                    },
                    child: const ButtonContainer(
                        icon: Icons.view_list,
                        text: 'Expectant mothers', //ನಿರೀಕ್ಷಿತ ತಾಯಂದಿರು'
                        color: Color.fromARGB(255, 235, 114, 154)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/warning_screen');
                    },
                    child:const ButtonContainer(
                      icon: Icons.alarm,
                      text: 'Due Dates', 
                      color: Colors.indigo),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/warnings');
                    },
                    child:const ButtonContainer(
                      icon: Icons.alarm,
                      text: 'Warnings', 
                      color: Colors.green),
                  ),
                  const ButtonContainer(
                      icon: Icons.online_prediction,
                      text: 'High Risk RHID', //'ಅಪಾಯದ RHID'
                      color: Colors.orange),
                  const ButtonContainer(
                      icon: Icons.help,
                      text: 'Immigrant RHID', //'ವಲಸಿಗರ RHID',
                      color: Colors.blue),
                      GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ANCdelay');
                    },
                    child: const ButtonContainer(
                        icon: Icons.hourglass_empty,
                        text: 'ANC Delay', 
                        color: Colors.red),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/delay');
                    },
                    child: const ButtonContainer(
                        icon: Icons.watch_later,
                        text: 'Delay', 
                        color: Colors.amber),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/hbchart');
                    },
                    child: const ButtonContainer(
                        icon: Icons.pie_chart,
                        text: 'Haemoglobin Chart', 
                        color: Colors.teal),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,'/health_grievance');
                    },
                    child: const ButtonContainer(
                        icon: Icons.health_and_safety_sharp,
                        text: 'Health Grievances', 
                        color: Colors.purple),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,'/complaints_list');
                    },
                    child: const ButtonContainer(
                        icon: Icons.feedback_outlined,
                        text: 'Complaints', 
                        color: Color.fromARGB(255, 247, 19, 3)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}