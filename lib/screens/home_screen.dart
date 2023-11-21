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
  var _textFieldController;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ಸುಲಲಿತ ಆರೈಕೆ",
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
                      "ನಮಸ್ಕಾರ ಸುಮತಿ",
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
                'ಮುಂದಿನ PHC ಭೇಟಿ 16ನೇ ಅಕ್ಟೋಬರ್ 2023',
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
                  GestureDetector(
                    onTap: () {
                      _displayTextInputDialog(context);
                    },
                    child: ButtonContainer(
                        icon: Icons.emergency,
                        text: 'ತುರ್ತು ಪರಿಸ್ಥಿತಿ',
                        color: Colors.deepPurple),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: ButtonContainer(
                        icon: Icons.woman,
                        text: 'ವೈಯಕ್ತಿಕ ವಿವರ',
                        color: Colors.green),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/complaints');
                    },
                    child: ButtonContainer(
                        icon: Icons.comment,
                        text: 'ದೂರುಗಳು',
                        color: Colors.orange),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/faq');
                    },
                    child: ButtonContainer(
                        icon: Icons.help,
                        text: 'ಪ್ರಶ್ನೆಗಳು',
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            Text(
              "ತುರ್ತು ಸಂಪರ್ಕಗಳು",
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
                  "ಶ್ರೀಮತಿ ಆಶಾ ಕಾರ್ಯಕರ್ತೆ",
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
                  "ಡಾ ಕರ್ತವ್ಯ ವೈದ್ಯ",
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
                  "ಡಾ ಕರ್ತವ್ಯ ವೈದ್ಯ",
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

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ತುರ್ತು ಪರಿಸ್ಥಿತಿಯ ಸಂದರ್ಭದಲ್ಲಿ'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  //valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  InputDecoration(hintText: "ಹುಟ್ಟಿದ ವರ್ಷವನ್ನು ನಮೂದಿಸಿ"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('ಸಲ್ಲಿಸು'),
                onPressed: () {
                  setState(() {
                    //codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
