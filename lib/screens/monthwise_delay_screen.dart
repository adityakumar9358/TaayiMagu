import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'patients.dart';
import 'DetailsScreen.dart';

class MonthwiseDelay extends StatefulWidget {
  const MonthwiseDelay({super.key});

  @override
  State<MonthwiseDelay> createState() => _MonthwiseDelayState();
}

class _MonthwiseDelayState extends State<MonthwiseDelay> {
  Map<String, List<Patient>> groupedPatients = {};

  @override
  void initState() {
    super.initState();
    groupPatientsByMonth();
  }

  void groupPatientsByMonth() {
    groupedPatients.clear();

    for (var patient in patients) {
      final monthYear = DateFormat('MMMM yyyy').format(patient.LastAppointment);
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
          style: theme.textTheme.titleLarge,
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
                  color: patient.LastAppointment.add(const Duration(days: 14)).isBefore(DateTime.now())
                      ? Colors.red
                      : Colors.blue,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      patient.name,
                      style: TextStyle(
                        color: patient.LastAppointment.add(const Duration(days: 14)).isBefore(DateTime.now())
                            ? Colors.red
                            : Colors.blue,
                      ),
                    ),
                    Text(
                      '${(patient.LastAppointment.difference(DateTime.now()).inDays) * -1} days ago',
                      style: TextStyle(
                        color: patient.LastAppointment.add(const Duration(days: 14)).isBefore(DateTime.now())
                            ? Colors.red
                            : Colors.blue,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  'Missed Appointment Date: ${DateFormat('dd-MMM-yyyy').format(patient.LastAppointment)}',
                ),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(patient: patient),
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

void main() {
  runApp(const MaterialApp(
    home: MonthwiseDelay(),
  ));
}
