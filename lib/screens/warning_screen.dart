import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'patients.dart';
import 'DetailsScreen.dart';

class WarningScreen extends StatefulWidget {
  const WarningScreen({Key? key}) : super(key: key);

  @override
  _WarningScreenState createState() => _WarningScreenState();
}

class _WarningScreenState extends State<WarningScreen> {
  @override
  Widget build(BuildContext context) {
    // Sorted patients list based on dueDate in ascending order
    patients.sort((a, b) => a.dueDate.compareTo(b.dueDate));

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Due Date of Mothers",
          style: theme.textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          int daysUntilDueDate = patients[index].dueDate.difference(DateTime.now()).inDays;
          Color textColor = daysUntilDueDate < 0 ? Colors.red : Colors.blue;
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
                color: textColor,
              ),
              title: Row(
                children: [
                  Text(
                    patients[index].name,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${daysUntilDueDate.abs()} days',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                'Due Date on ${DateFormat('dd-MMM-yyyy').format(patients[index].dueDate)}',
              ),
            ),
          );
        },
      ),
    );
  }
}
