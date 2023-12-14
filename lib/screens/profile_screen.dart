import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final questions = [
    {
      'question': 'personal details',
      'answer':
          'Sumathi S \n DOB: 10-10-1995 \n Age: 28y 1m \n Weight: 168 lb \n Height: 5.1 ft'
    },
    {
      'question': 'health details',
      'answer':
          'Current Medications: Folic Acid, Ketorolac (acular) \n Blood Pressure: 121/75 \n Pulse: 67 bpm \n Notes: Patient had severe sinusitis with facial discomfort about two to three months ago, nasal congestion, eye pain and postnasal drip. Symptoms \n Lab results: X-ray, CT'
    }
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Details",
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index]['question'];
            final answer = questions[index]['answer'];
            return ExpansionTile(
              title: Text(question!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(answer!),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
