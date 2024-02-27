import 'package:flutter/material.dart';
import 'patients.dart';


class DetailScreen extends StatefulWidget {
  final Patient patient;

  const DetailScreen({super.key, required this.patient});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.patient.name}'s Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs with Enhanced Border and Styling
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ), // Added border
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "Personal Details",
                  // Updated styling for unselected tab
                  iconMargin: EdgeInsets.only(bottom: 8),
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: "Health Details",
                  // Updated styling for unselected tab
                  iconMargin: EdgeInsets.only(bottom: 8),
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  text: "Contact Info",
                  // Updated styling for unselected tab
                  iconMargin: EdgeInsets.only(bottom: 8),
                  icon: Icon(Icons.phone),
                ),
              ],
              indicatorColor: Colors.white,
              labelColor:
                  Colors.purple[400], // Set the color for the selected tab text
              unselectedLabelColor: theme.primaryColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Expanded TabBarView
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Personal Details Tab
                  _buildPersonalDetailsTab(widget.patient),

                  // Health Details Tab
                  _buildHealthDetailsTab(widget.patient),

                  // Contact Info Tab
                  _buildContactInfoTab(widget.patient),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalDetailsTab(Patient patient) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Age: ${patient.age}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Weight: ${patient.weight}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Height: ${patient.height}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthDetailsTab(Patient patient) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
  patient.hb == 0.0 ? "Haemoglobin(Hb): Haemoglobin not entered!" : "Haemoglobin(Hb): ${patient.hb}",
  style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),

            const SizedBox(height: 8),
            Text(
              "Pulse: ${patient.pulse}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "SpO2: ${patient.spo2}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Glucose: ${patient.gluc}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Fetal Heart Rate: ${patient.fhr}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoTab(Patient patient) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone Number: ${patient.phno}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}