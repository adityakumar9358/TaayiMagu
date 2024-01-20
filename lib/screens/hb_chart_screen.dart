import 'package:fl_chart/fl_chart.dart';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HbChart extends StatefulWidget {
  const HbChart({Key? key}) : super(key: key);

  @override
  State<HbChart> createState() => _HbChartState();
}

class Patient {
  final String name;
  final DateTime lastAppointment;
  final double hb;
  final int pulse;
  final int spo2;
  final int gluc;
  final int fhr;

  Patient(this.name, this.lastAppointment, this.hb, this.pulse, this.spo2, this.gluc, this.fhr);
}

class _HbChartState extends State<HbChart> {
  final List<Patient> patients = [
    Patient('Expectant Mother 1', DateTime.parse('2023-08-15 15:30:00'), 10.0, 75, 98, 90, 140),
    Patient('Expectant Mother 2', DateTime.parse('2023-08-20 10:15:00'), 10.0, 85, 98, 90, 140),
    Patient('Expectant Mother 3', DateTime.parse('2023-08-25 14:00:00'), 10.0, 95, 93, 90, 140),
    Patient('Expectant Mother 4', DateTime.parse('2023-09-01 11:30:00'), 10.2, 90, 98, 160, 140),
    Patient('Expectant Mother 5', DateTime.parse('2023-09-05 10:15:00'), 14.5, 105, 98, 90, 110),
    Patient('Expectant Mother 6', DateTime.parse('2023-09-07 16:30:00'), 15.1, 65, 98, 90, 100),
    Patient('Expectant Mother 7', DateTime.parse('2023-09-10 12:15:00'), 15.5, 96, 97, 90, 150),
    Patient('Expectant Mother 8', DateTime.parse('2023-09-13 15:10:00'), 16.2, 97, 99, 80, 140),
    Patient('Expectant Mother 9', DateTime.parse('2023-09-14 13:01:00'), 13.6, 98, 98, 99, 144),
    Patient('Expectant Mother 10', DateTime.parse('2023-09-30 11:35:00'), 9.9, 99, 99, 70, 157),
    Patient('Expectant Mother 11', DateTime.parse('2023-10-02 15:05:00'), 0.0, 90, 95, 78, 141),
  ];

  String selectedCategory = 'Normal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hb Chart'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: PieChart(
              PieChartData(
                sections: generateSections(),
                centerSpaceRadius: 60,
                sectionsSpace: 0,
                pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    return;
                  }

                  setState(() {
                    selectedCategory = getCategoryFromIndex(pieTouchResponse.touchedSection!.touchedSectionIndex);
                  });

                  //list of patients for the selected category
                  _showPatientsForCategory(context, selectedCategory);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> generateSections() {
    double totalPatients = patients.length.toDouble();

    return List.generate(3, (i) {
      double value;
      String category;
      Color color;

      switch (i) {
        case 0:
          value = patients.where((p) => p.hb > 12.5).length / totalPatients;
          category = 'Normal';
          color = Colors.green;
          break;
        case 1:
          value = patients.where((p) => p.hb >= 10 && p.hb <= 12.5).length / totalPatients;
          category = 'Low';
          color = Colors.yellow;
          break;
        case 2:
          value = patients.where((p) => p.hb < 10).length / totalPatients;
          category = 'Very Low';
          color = Colors.red;
          break;
        default:
          value = 0;
          category = '';
          color = Colors.transparent;
      }

      return PieChartSectionData(
        color: color,
        value: value,
        title: '$category\n${(value * 100).toStringAsFixed(2)}%',
        radius: 70,
        titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      );
    });
  }

  String getCategoryFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Normal';
      case 1:
        return 'Low';
      case 2:
        return 'Very Low';
      default:
        return '';
    }
  }

  void _showPatientsForCategory(BuildContext context, String category) {
  List<Patient> filteredPatients;
  String haemoglobinRange;

  switch (category) {
    case 'Normal':
      filteredPatients = patients.where((p) => p.hb > 12.5).toList();
      haemoglobinRange = '> 12.5';
      break;
    case 'Low':
      filteredPatients = patients.where((p) => p.hb >= 10 && p.hb <= 12.5).toList();
      haemoglobinRange = '10.0 - 12.5';
      break;
    case 'Very Low':
      filteredPatients = patients.where((p) => p.hb < 10).toList();
      haemoglobinRange = '< 10.0';
      break;
    default:
      filteredPatients = [];
      haemoglobinRange = '';
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Patients in $category Category(Haemoglobin Range: $haemoglobinRange)'),
      content: Column(
        children: [
          for (var patient in filteredPatients) Text(patient.name),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    ),
  );
}
}