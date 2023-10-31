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
      'question': 'Personal Details',
      'answer':
          ' Sumathi S \n DOB: 10-10-1995 \n Age: 28y 1m  \n Weight: 168 lb \n Height: 5.1f'
    },
    {
      'question': 'Health Details',
      'answer':
          ' Current Medications: Folic Acid, Ketorolac (Acular) \n Blood Pressure: 121/75 \n Pulse: 67 BPM \n Notes: Patient having severe sinusitis about two to three months ago with facial discomfort., nasal congestion, eye pain, and potnasal drip symptoms.  \n Lab Results: X-Ray, CT'
    }
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sulalitha Aaraike",
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
