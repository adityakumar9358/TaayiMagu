import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatefulWidget {
  ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class Patient {
  final String name;
  final DateTime nextVisitDate;

  Patient(this.name, this.nextVisitDate);
}

class _ListScreenState extends State<ListScreen> {
  final List<Patient> patients = [
    Patient('Expectant Mother 6', DateTime.parse('2023-10-05 15:30:00')),
    Patient('Expectant Mother 1', DateTime.parse('2023-10-15 15:30:00')),
    Patient('Expectant Mother 2', DateTime.parse('2023-11-20 15:30:00')),
    Patient('Expectant Mother 3', DateTime.parse('2023-11-25 15:30:00')),
    Patient('Expectant Mother 4', DateTime.parse('2023-12-01 15:30:00')),
    Patient('Expectant Mother 5', DateTime.parse('2023-12-05 15:30:00')),
    Patient('Expectant Mother 7', DateTime.parse('2023-12-06 15:30:00')),
    Patient('Expectant Mother 8', DateTime.parse('2023-12-06 15:30:00')),
    Patient('Expectant Mother 9', DateTime.parse('2023-12-07 15:30:00')),
    // Add more patient data here
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expectant Mothers",
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
              color: patients[index].nextVisitDate.isBefore(DateTime.now())
                  ? Colors.red
                  : Colors.blue,
            ), // Icon for patients
            title: Text(patients[index].name,
                style: TextStyle(
                  color: patients[index].nextVisitDate.isBefore(DateTime.now())
                      ? Colors.red
                      : Colors.blue,
                )),
            subtitle: Text(
              'Next PHC Visit: ${DateFormat('dd-MMM-yyyy').format(patients[index].nextVisitDate)}',
            ),
            onTap: () {
              // Add navigation to patient details page or other actions here
            },
          );
        },
      ),
    );
  }
}
