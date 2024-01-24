import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthwiseDelay extends StatefulWidget {
  const MonthwiseDelay({super.key});

  @override
  State<MonthwiseDelay> createState() => _MonthwiseDelayState();
}

class Patient {
  final String name;
  final DateTime MissedDate;

  Patient(this.name, this.MissedDate);
}

class _MonthwiseDelayState extends State<MonthwiseDelay> {
  final List<Patient> patients = [
    Patient('Expectant Mother 1', DateTime.parse('2023-10-15 15:30:00')),
    Patient('Expectant Mother 2', DateTime.parse('2023-10-20 10:15:00')),
    Patient('Expectant Mother 3', DateTime.parse('2023-10-25 14:00:00')),
    Patient('Expectant Mother 4', DateTime.parse('2023-11-01 11:30:00')),
    Patient('Expectant Mother 5', DateTime.parse('2023-11-05 10:15:00')),
    Patient('Expectant Mother 6', DateTime.parse('2023-12-07 16:30:00')),
    Patient('Expectant Mother 7', DateTime.parse('2023-12-10 12:15:00')),
    Patient('Expectant Mother 8', DateTime.parse('2023-12-13 15:10:00')),
    Patient('Expectant Mother 9', DateTime.parse('2024-01-14 13:01:00')),
    Patient('Expectant Mother 10', DateTime.parse('2024-01-03 11:35:00')),
    Patient('Expectant Mother 11', DateTime.parse('2024-01-05 15:05:00')),
    Patient('Expectant Mother 12', DateTime.parse('2024-01-17 16:10:00')),
    Patient('Expectant Mother 13', DateTime.parse('2024-01-20 16:10:00')),
  ];

  Map<String, List<Patient>> groupedPatients = {};

  @override
  void initState() {
    super.initState();
    groupPatientsByMonth();
  }

  void groupPatientsByMonth() {
    groupedPatients.clear();

    for (var patient in patients) {
      final monthYear = DateFormat('MMMM yyyy').format(patient.MissedDate);
      if (!groupedPatients.containsKey(monthYear)) {
        groupedPatients[monthYear] = [];
      }
      groupedPatients[monthYear]?.add(patient);
    }
  }

 @override
Widget build(BuildContext context) {
  ThemeData theme = Theme.of(context);
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Monthwise Delay(>14 Days)",
        style: theme.textTheme.headlineMedium,
        textAlign: TextAlign.left,
      ),
      automaticallyImplyLeading: false,
    ),
    body: ListView.builder(
      itemCount: groupedPatients.keys.length,
      itemBuilder: (context, index) {
        final monthYear = groupedPatients.keys.elementAt(index);
        final patientsInMonth = groupedPatients[monthYear] ?? [];

        return ExpansionTile(
          title: Text(monthYear),
          children: patientsInMonth.map((patient) {
            return ListTile(
              leading: Icon(
                Icons.person,
                color: patient.MissedDate
                            .add(const Duration(days: 14))
                            .isBefore(DateTime.now())
                    ? Colors.red
                    : Colors.blue,
              ),
              title: Text(
                patient.name,
                style: TextStyle(
                  color: patient.MissedDate
                              .add(const Duration(days: 14))
                              .isBefore(DateTime.now())
                      ? Colors.red
                      : Colors.blue,
                ),
              ),
              subtitle: Text(
                'Missed Appointment Date: ${DateFormat('dd-MMM-yyyy').format(patient.MissedDate)}',
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
                        child: const Text('Close'),
                      )
                    ],
                    title: const Text('Alert!'),
                    contentPadding: const EdgeInsets.all(20),
                    content:
                        Text('Missed Appointment ${(patient.MissedDate.difference(DateTime.now()).inDays) * -1} days ago'),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    ),
  );
}
}