import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  _FAQScreen createState() => _FAQScreen();
}

class _FAQScreen extends State<FAQScreen> {
  final questions = [
    {
      'question': 'Are there any foods I should avoid during pregnancy?',
      'answer':
          'Avoid consuming any bacteria that can be harmful to your health. There is a possibility of contracting harmful bacteria from uncooked or undercooked meats, fish, and poultry. To prevent problems, thoroughly cook and handle meats, fish, and poultry, and clean cutting boards, knives, and utensils after use. Avoid consuming raw or undercooked eggs.'
    },
    {
      'question': 'Can I continue drinking coffee?',
      'answer':
          'Drinking one cup of coffee per day (equivalent to 12 ounces or 200 milligrams of caffeine) is considered safe. Higher amounts of caffeine can increase the risk of miscarriage or premature birth, but the results of research are not clear. When keeping track of how much you consume, take into account tea, chocolate, hot beverages, and other sources of caffeine.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questions",
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index]['question'];
            final answer = questions[index]['answer'];
            return ExpansionTile(
              title: Text(question!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(answer!),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
