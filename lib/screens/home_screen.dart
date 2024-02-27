import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import generated localization

import '../utils/helper_functions.dart';
import '../widgets/button_container.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) setLocale;

  const HomeScreen({super.key, required this.setLocale});

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

  bool isEnglish = true;

  void _toggleLanguage() {
    if (isEnglish) {
      widget.setLocale(const Locale('ka'));
    } else {
      widget.setLocale(const Locale('en'));
    }
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.key1, // 'Janani'
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
            icon: Icon(isEnglish ? Icons.language : Icons.translate),
            onPressed: _toggleLanguage,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                        localizations.key2, // 'Hello Sumathi'
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text(localizations.key3), // 'Card Number- 2005678'
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  localizations.key4, // 'Next PHC visit 16th October 2023'
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 400,
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
                          icon: Icons.notification_important_rounded,
                          text: localizations.key5, // 'Emergency'
                          color: Colors.red),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: ButtonContainer(
                          icon: Icons.pregnant_woman_sharp,
                          text: localizations.key6, // 'Personal Details'
                          color: Colors.green),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/faq');
                      },
                      child: ButtonContainer(
                          icon: Icons.help,
                          text: localizations.key7, // 'FAQ'
                          color: Colors.blue),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/complaints');
                      },
                      child: ButtonContainer(
                          icon: Icons.report,
                          text: localizations.key8, // 'Complaints'
                          color: Colors.orange),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  localizations.key9, // 'Important Contact Number'
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              _buildContactRow(context, Icons.phone, localizations.key10,
                  "+91 989999999"), // 'Asha Worker'
              _buildContactRow(context, Icons.phone, localizations.key11,
                  "+91 989999999"), // 'Duty Doctor'
              _buildContactRow(context, Icons.phone, localizations.key12,
                  "+91 989999999"), // 'PHC'
              _buildContactRow(context, Icons.phone, localizations.key13,
                  "+91 989999999"), // 'PHC Doctor Number'
              _buildContactRow(context, Icons.phone, localizations.key14,
                  "+91 989999999"), // 'Personal Gynaec Number'
            ],
          ),
        ),
      ),
    );
  }

  Row _buildContactRow(
      BuildContext context, IconData icon, String label, String number) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            setState(() {
              _makePhoneCall(Uri.parse('tel:$number'));
            });
          },
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(number),
      ],
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(localizations.key15), // 'In case of Emergency'
            content: TextField(
              onChanged: (value) {
                setState(() {
                  //valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(
                  hintText: localizations.key16), // 'Enter 1234'
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text(localizations.key17), // 'Submit'
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
