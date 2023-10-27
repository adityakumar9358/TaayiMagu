import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/helper_functions.dart';
import '../widgets/button_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> _makePhoneCall(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sulalitha Aaraike",
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
                      "Hello Sumathi",
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
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ' PHC visit is due on 16th October 2023 ',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 380,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: <Widget>[
                  ButtonContainer(
                      icon: Icons.emergency,
                      text: 'Emergency',
                      color: Colors.deepPurple),
                  ButtonContainer(
                      icon: Icons.woman, text: 'Profile', color: Colors.green),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/complaints');
                    },
                    child: ButtonContainer(
                        icon: Icons.comment,
                        text: 'Complaints',
                        color: Colors.orange),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/faq');
                    },
                    child: ButtonContainer(
                        icon: Icons.help, text: 'FAQ', color: Colors.blue),
                  ),
                ],
              ),
            ),
            Text(
              "Emergency Contacts",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: new Icon(Icons.phone),
                  onPressed: () {
                    setState(() {
                      _makePhoneCall(Uri.parse('tel:0597924917'));
                    });
                  },
                ),
                Text(
                  "Mrs Asha Karyikarethe",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text("+91 989999999"),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: new Icon(Icons.phone),
                  onPressed: () {
                    setState(() {
                      _makePhoneCall(Uri.parse('tel:0597924917'));
                    });
                  },
                ),
                Text(
                  "Dr Duty Doctor",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text("+91 989999999"),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: new Icon(Icons.phone),
                  onPressed: () {
                    setState(() {
                      _makePhoneCall(Uri.parse('tel:0597924917'));
                    });
                  },
                ),
                Text(
                  "Dr Duty Doctor",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text("+91 989999999"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
