import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';
import 'dart:math';
import 'DetailsScreen.dart';
import 'patients.dart';

class ComplaintsList extends StatefulWidget {
  const ComplaintsList({super.key});

  @override
  State<ComplaintsList> createState() => _ComplaintsListState();
}

List<String> complaints = [
  'Asha workers are not responding properly',
  'Health assistants are not working properly.',
  'During the visit to the health institution, the medical officer did not conduct proper inspection.',
  '108 did not arrive on time.',
  'Doctors did not take proper care during delivery.',
  'Improper treatment of childbirth.',
  'The doctor does not treat the newborn properly.',
  'Injections are not given on time.',
  'No health assistant visited the home related to the pregnancy.',
  'Other',
];

class _ComplaintsListState extends State<ComplaintsList> {

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaints',
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];

          int randomIndex = random.nextInt(complaints.length);
          String randomComplaint = complaints[randomIndex];

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
}
