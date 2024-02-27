import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'DetailsScreen.dart';
import 'patients.dart';

class HbChart extends StatefulWidget {
  const HbChart({super.key});

  @override
  State<HbChart> createState() => _HbChartState();
}

class _HbChartState extends State<HbChart> {
  String selectedCategory = 'Normal';

  @override
  Widget build(BuildContext context) {
    patients.sort((a, b) => a.hb.compareTo(b.hb)); // Sorting patients by haemoglobin values

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hb Chart'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: generateSections(),
                centerSpaceRadius: 60,
                sectionsSpace: 0,
                pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                    return;
                  }

                  setState(() {
                    selectedCategory = getCategoryFromIndex(pieTouchResponse.touchedSection!.touchedSectionIndex);
                  });
                }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Patients in $selectedCategory Category',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: generatePatientList(selectedCategory),
                    ),
                  ),
                ],
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
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
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

  List<Widget> generatePatientList(String category) {
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

    return filteredPatients.map((patient) => buildPatientTile(patient, haemoglobinRange)).toList();
  }

  Widget buildPatientTile(Patient patient, String haemoglobinRange) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(patient.name),
          Text('Haemoglobin: ${patient.hb}'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(patient: patient)),
              );
            },
            child: const Text('View Profile'),
          ),
        ],
      ),
    );
  }
}
