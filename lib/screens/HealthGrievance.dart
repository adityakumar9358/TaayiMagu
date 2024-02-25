import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';
import 'dart:math';
import 'DetailsScreen.dart';
import 'patients.dart';

class HealthGrievance extends StatefulWidget {
  const HealthGrievance({super.key});

  @override
  State<HealthGrievance> createState() => _HealthGrievanceState();
}

List<String> categories = [
  'Pain Abdomen / Backache',
  'Intermittent Abdominal tightening',
  'Leaking PV',
  'Bleeding PV / Spotting PV',
  'WDPV / Itching PV',
  'Burning Micturition',
  'Giddiness / Fatigue',
  'Headache',
  'Vomiting',
  'Blurring of Vision',
  'Epigastric Pain / Heart Burn',
  'Breathlessness'
];

class _HealthGrievanceState extends State<HealthGrievance> {

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Grievances',style: TextStyle(
                  fontSize: 28.0,
                ),
                ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];

          int randomIndex = random.nextInt(categories.length);
          String randomComplaint = categories[randomIndex];

          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.lightBlueAccent,
            child: ListTile(
              title: Text(
                patient.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Complaint: $randomComplaint'
                '\nSubmitted on: ${HelperFunctions.formatDateTime(patient.ComplainDateTime)}',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(patient: patient),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

   void _showPatientDetails(BuildContext context, Patient patient) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Latest Patient Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Haemoglobin (Hb): ${patient.hb}'),
            Text('Pulse: ${patient.pulse}'),
            Text('SpO2: ${patient.spo2}'),
            Text('Glucose (Gluc): ${patient.gluc}'),
            Text('Fetal Heart Rate (FHR): ${patient.fhr}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
