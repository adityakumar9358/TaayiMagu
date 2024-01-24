import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final profileImage = "images/profile_image.jpeg";
  final profileName = "Sumathi S";

  final personalDetails = {
    'DOB': '10-10-1995',
    'Age': '28y 1m',
    'Weight': '168 lb',
    'Height': '5.1 ft',
  };

  final healthDetails = {
    'Current Medications': 'Folic Acid, Ketorolac (acular)',
    'Blood Pressure': '121/75',
    'Pulse': '67 bpm',
    'Notes':
        'Patient had severe sinusitis with facial discomfort about two to three months ago, nasal congestion, eye pain and postnasal drip. Symptoms',
    'Lab results': 'X-ray, CT',
  };

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData(
      primaryColor: Colors.teal,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image and Name
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 127, 208, 205),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.teal, // Improved border color
              backgroundImage: AssetImage(profileImage),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            profileName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),

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
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Personal Details Tab
                  _buildDetailsTab(personalDetails),

                  // Health Details Tab
                  _buildDetailsTab(healthDetails),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(Map<String, String> details) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details.entries
              .map(
                (entry) => Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${entry.key}:",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfileScreen(),
  ));
}
