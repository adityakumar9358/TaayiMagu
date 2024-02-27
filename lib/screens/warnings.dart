import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DetailsScreen.dart';
import 'patients.dart';

class Warnings extends StatefulWidget {
  const Warnings({super.key});

  @override
  State<Warnings> createState() => _WarningsState();
}

class _WarningsState extends State<Warnings> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Patient> abnormalPatients = patients.where((patient) =>
        patient.hb < 12.0 ||
        patient.hb > 15.5 ||
        patient.hb == 0.0 ||
        patient.pulse < 60 ||
        patient.pulse > 100 ||
        patient.spo2 < 95 ||
        patient.spo2 > 100 ||
        patient.gluc > 126 ||
        patient.fhr < 120 ||
        patient.fhr > 160).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Warnings",
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: abnormalPatients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.person,
              color: _getPatientColor(abnormalPatients[index]),
            ),
            title: Text(
              abnormalPatients[index].name,
              style: TextStyle(
                color: _getPatientColor(abnormalPatients[index]),
              ),
            ),
            subtitle: Text(
              'Last Appointment Date: ${DateFormat('dd-MMM-yyyy').format(abnormalPatients[index].LastAppointment)}',
            ),
            onTap: () {
              _showAlert(context, abnormalPatients[index]);
            },
          );
        },
      ),
    );
  }

  Color _getPatientColor(Patient patient) {
    //color based on vital sign values
    if (patient.hb < 12.0 ||
        patient.hb > 15.5 ||
        patient.hb == 0.0 ||
        patient.pulse < 60 ||
        patient.pulse > 100 ||
        patient.spo2 < 95 ||
        patient.spo2 > 100 ||
        patient.gluc > 126 ||
        patient.fhr < 120 ||
        patient.fhr > 160) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  void _showAlert(BuildContext context, Patient patient) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          ElevatedButton(
            onPressed: () {
              launch('tel:${patient.phno}');
            },
            child: const Text('Call'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(patient: patient),
                ),
              );
            },
            child: const Text('View Profile'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
        title: const Text('Details:'),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Patient: ${patient.name}'),
            const SizedBox(height: 10),
            if (patient.hb == 0.0)
              const Text(
                'Warning! Haemoglobin not entered',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            else if (patient.hb < 12.0 || patient.hb > 15.5)
              Text(
                'Haemoglobin (Hb): ${patient.hb}',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            else
              Text('Haemoglobin (Hb): ${patient.hb}'),
            if (patient.pulse < 60 || patient.pulse > 100)
              Text(
                'Pulse: ${patient.pulse}',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            else
              Text('Pulse: ${patient.pulse}'),
            if (patient.spo2 < 95 || patient.spo2 > 100)
              Text(
                'SpO2: ${patient.spo2}',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            else
              Text('SpO2: ${patient.spo2}'),
            if (patient.gluc > 126)
              Text(
                'Glucose: ${patient.gluc}',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            else
              Text('Glucose: ${patient.gluc}'),
            if (patient.fhr < 120 || patient.fhr > 160)
              Text(
                'Fetal Heart Rate (FHR): ${patient.fhr}',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            else
              Text('Fetal Heart Rate (FHR): ${patient.fhr}'),
            const SizedBox(height: 10),
            Text('Last Appointment: ${DateFormat('dd-MMM-yyyy').format(patient.LastAppointment)}'),
          ],
        ),
      ),
    );
  }
}
