import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'patients.dart';
import 'DetailsScreen.dart';

class DelayScreen extends StatefulWidget {
  const DelayScreen({super.key});

  @override
  _DelayScreenState createState() => _DelayScreenState();
}

class _DelayScreenState extends State<DelayScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ANC Delay",
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          int daysSinceFirstANC = patients[index]
              .firstAncDate
              .difference(DateTime.now())
              .inDays
              .abs();
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(patient: patients[index]),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: patients[index].firstAncDate
                        .add(const Duration(days: 90))
                        .isBefore(DateTime.now())
                    ? Colors.red
                    : Colors.blue,
              ),
              title: Row(
                children: [
                  Text(
                    patients[index].name,
                    style: TextStyle(
                      color: patients[index].firstAncDate
                              .add(const Duration(days: 90))
                              .isBefore(DateTime.now())
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '$daysSinceFirstANC days',
                    style: TextStyle(
                      color: patients[index].firstAncDate
                              .add(const Duration(days: 90))
                              .isBefore(DateTime.now())
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                'First ANC Date: ${DateFormat('dd-MMM-yyyy').format(patients[index].firstAncDate)}',
              ),
            ),
          );
        },
      ),
    );
  }
}
