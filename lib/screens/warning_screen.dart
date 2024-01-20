import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';
import 'package:intl/intl.dart';

class WarningScreen extends StatefulWidget {
  WarningScreen({super.key});

  @override
  _WarningScreenState createState() => _WarningScreenState();
}

class Patient {
  final String name;
  final DateTime dueDate;
  //final Date dueDate;

  Patient(this.name, this.dueDate);
}

class _WarningScreenState extends State<WarningScreen> {
  final List<Patient> patients = [
    Patient('Expectant Mother 1', DateTime.parse('2024-01-26')),
    Patient('Expectant Mother 2', DateTime.parse('2024-01-27')),
    Patient('Expectant Mother 3', DateTime.parse('2024-01-25')),
    Patient('Expectant Mother 4', DateTime.parse('2024-02-02')),
    Patient('Expectant Mother 5', DateTime.parse('2024-01-31')),
    Patient('Expectant Mother 6', DateTime.parse('2024-05-05')),
    Patient('Expectant Mother 7', DateTime.parse('2024-07-20')),
    Patient('Expectant Mother 8', DateTime.parse('2024-07-18')),
    Patient('Expectant Mother 9', DateTime.parse('2024-08-31')),
  ];

  @override
  Widget build(BuildContext context) {
    // Sorted patients list based on dueDate in ascending order
    patients.sort((a, b) => a.dueDate.compareTo(b.dueDate));

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Due Date of Mothers",
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.person,
              color: patients[index].dueDate.subtract(Duration(days: 7)).isBefore(DateTime.now())
                  ? Colors.red
                  : Colors.blue,
            ),
            title: Text(
              patients[index].name,
              style: TextStyle(
                color: patients[index].dueDate.subtract(Duration(days: 7)).isBefore(DateTime.now())
                    ? Colors.red
                    : Colors.blue,
              ),
            ),
            subtitle: Text(
              'Due Date on ${DateFormat('dd-MMM-yyyy').format(patients[index].dueDate)}',
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    )
                  ],
                  title: const Text('Reminder'),
                  contentPadding: const EdgeInsets.all(20),
                  content: Text(
                      'Due date is in ${(patients[index].dueDate.difference(DateTime.now()).inDays)} days'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}