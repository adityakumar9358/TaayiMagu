import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DelayScreen extends StatefulWidget {
  const DelayScreen({super.key});

  @override
  _DelayScreenState createState() => _DelayScreenState();
}

class Patient {
  final String name;
  final DateTime firstAncDate;

  Patient(this.name, this.firstAncDate);
}

class _DelayScreenState extends State<DelayScreen> {
  final List<Patient> patients = [
    Patient('Expectant Mother 1', DateTime.parse('2023-10-15 15:30:00')),
    Patient('Expectant Mother 2', DateTime.parse('2023-10-18 10:15:00')),
    Patient('Expectant Mother 3', DateTime.parse('2023-10-20 14:00:00')),
    Patient('Expectant Mother 4', DateTime.parse('2023-10-25 11:30:00')),
    Patient('Expectant Mother 5', DateTime.parse('2023-12-05 10:15:00')),
    Patient('Expectant Mother 6', DateTime.parse('2023-12-07 16:30:00')),
    Patient('Expectant Mother 7', DateTime.parse('2023-12-10 12:15:00')),
    Patient('Expectant Mother 8', DateTime.parse('2024-01-13 15:10:00')),
    Patient('Expectant Mother 9', DateTime.parse('2024-01-14 13:01:00')),
    Patient('Expectant Mother 10', DateTime.parse('2024-01-16 11:35:00')),
    Patient('Expectant Mother 11', DateTime.parse('2024-01-19 15:05:00')),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ANC Delay",
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.person,
              color: patients[index].firstAncDate.add(Duration(days: 90)).isBefore(DateTime.now())
                  ? Colors.red
                  : Colors.blue,
            ), // Icon for patients
            title: Text(patients[index].name,
                style: TextStyle(
                  color: patients[index].firstAncDate.add(Duration(days: 90)).isBefore(DateTime.now())
                      ? Colors.red
                      : Colors.blue,
                )),
            subtitle: Text(
              'First ANC Date: ${DateFormat('dd-MMM-yyyy').format(patients[index].firstAncDate)}',
            ),
            onTap: () {
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('Close'))
                  ],
                  title: const Text('Alert!'),
                  contentPadding: const EdgeInsets.all(20),
                  content: Text ('First ANC was ${(patients[index].firstAncDate.difference(DateTime.now()).inDays)*-1} days ago'),
                )
                );
            },
          );
        },
      ),
    );
  }
}
