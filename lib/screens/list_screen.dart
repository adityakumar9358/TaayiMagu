import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DetailsScreen.dart';
import 'patients.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
  "Expected Mothers",
  style: theme.textTheme.headlineMedium!.copyWith(
    fontWeight: FontWeight.bold,
  ),
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
             color: Color.fromARGB(255, 20, 18, 19),
            ),
            title: Text(
              patients[index].name,
              style: TextStyle(
                color: Color.fromARGB(255, 20, 18, 19),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Last Appointment Date: ${DateFormat('dd-MMM-yyyy').format(patients[index].LastAppointment)}',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(patient: patients[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}