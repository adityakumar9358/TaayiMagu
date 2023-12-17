import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

List<String> categories = [
  'Pain Abdomen / Backache',
  'Intermittent Abdominal tightening',
  'Leaking PV',
  'Bleeding PV / Spotting PV',
  'WDPV / Itching PV',
  'Burning Micturition',
  'Giddiness / Fatigue',
  'Headache',
  'Vomiting',
  'Blurring of Vision',
  'Epigastric Pain / Heart Burn',
  'Breathlessness'
];
String? selectedCategory; // Variable to hold the selected category

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complaints", //"ದೂರುಗಳು",
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Sumathi", //ನಮಸ್ಕಾರ ಸುಮತಿ",
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      HelperFunctions.getGreeting(),
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.person),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Category', // Your label
                    border: OutlineInputBorder(),
                  ),
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 200,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: null, // <-- SEE HERE
                  maxLines: null,
                  expands: true, // <-- SEE HERE
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Details', //'ಘಟನೆಯ ವಿವರ',
                      hintText:
                          'Enter your complaints'), //'ನಿಮ್ಮ ದೂರನ್ನು ನಮೂದಿಸಿ'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text(
                  'Submit', //'ಸಲ್ಲಿಸು',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
