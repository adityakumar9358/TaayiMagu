import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnancy FAQ',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FAQScreen(),
    );
  }
}

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _sections = [
    {
      'title': 'Nutrition',
      'content': [
        {
          'question': 'What foods are safe during pregnancy?',
          'answer':
              'Focus on a balanced diet with fruits, vegetables, whole grains, lean protein, and dairy. Wash produce and cook meats thoroughly to avoid bacteria.'
        },
        {
          'question': 'Can I have sushi or rare steak?',
          'answer':
              'It\'s best to avoid raw or undercooked fish and meats during pregnancy due to the risk of bacteria and parasites that can harm the fetus.'
        },
        {
          'question': 'Is it safe to diet while pregnant?',
          'answer':
              'Dieting is not recommended during pregnancy. Instead, aim for a healthy, well-balanced diet that provides adequate nutrients for you and your baby.'
        },
        {
          'question': 'What about herbal teas and supplements?',
          'answer':
              'Some can be unsafe. Discuss with your healthcare provider before taking any herbs or supplements during pregnancy.'
        },
        {
          'question': 'Can I eat deli meats?',
          'answer':
              'Deli meats should be avoided unless they are heated to steaming hot to prevent the risk of listeriosis.'
        },
      ],
    },
    {
      'title': 'Wellness',
      'content': [
        {
          'question': 'How much exercise is safe?',
          'answer':
              'Most women can safely engage in moderate exercise. Consult your doctor to tailor an exercise plan to your specific needs.'
        },
        {
          'question': 'What are the signs of prenatal depression?',
          'answer':
              'Symptoms include persistent sadness, anxiety, and loss of interest in activities. If you experience these, seek help from a healthcare professional.'
        },
        {
          'question': 'Can I travel during pregnancy?',
          'answer':
              'Generally, travel is safe, but check with your doctor, especially during the last trimester or if you have pregnancy complications.'
        },
        {
          'question': 'How can I manage morning sickness?',
          'answer':
              'Eat small, frequent meals, avoid triggering smells, and consider ginger or vitamin B6 supplements after consulting your doctor.'
        },
        {
          'question': 'Is it normal to feel so tired?',
          'answer':
              'Fatigue is common due to hormonal changes and the body\'s extra work to support the pregnancy.'
        },
      ],
    },
    {
      'title': 'Appointments',
      'content': [
        {
          'question': 'How often should I see my doctor?',
          'answer':
              'A typical schedule is every 4-6 weeks up to 32 weeks, then more frequently. High-risk pregnancies may require more visits.'
        },
        {
          'question': 'What is a growth scan?',
          'answer':
              'A growth scan is an ultrasound to check the baby\'s size and position, usually performed in the third trimester.'
        },
        {
          'question': 'Can my partner attend appointments?',
          'answer':
              'Partners are usually welcome, but confirm with your healthcare provider due to any potential restrictions, such as during a pandemic.'
        },
        {
          'question': 'What should I ask during my first visit?',
          'answer':
              'Ask about vitamins, medications, dietary recommendations, and any lifestyle changes you should make.'
        },
        {
          'question': 'What screenings will I need?',
          'answer':
              'Screenings may include blood tests, ultrasounds, glucose screening, and genetic testing, among others.'
        },
      ],
    },
    {
      'title': 'Symptoms',
      'content': [
        {
          'question': 'Should I worry about occasional headaches?',
          'answer':
              'Headaches can be common; however, persistent or severe headaches should be discussed with your healthcare provider.'
        },
        {
          'question': 'What if I have cramping?',
          'answer':
              'Some cramping can be normal, but severe or persistent pain should be evaluated immediately.'
        },
        {
          'question': 'Is spotting a sign of miscarriage?',
          'answer':
              'Spotting can occur in healthy pregnancies, but it\'s important to report any bleeding to your doctor.'
        },
        {
          'question': 'Why am I experiencing swelling?',
          'answer':
              'Mild swelling is normal, but sudden or severe swelling could indicate preeclampsia and needs urgent medical attention.'
        },
        {
          'question': 'What can I do for heartburn relief?',
          'answer':
              'Avoid spicy and fatty foods, eat smaller meals, and try sleeping with your head elevated. Discuss safe antacids with your doctor.'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQs',
          style: TextStyle(
              fontSize: 32, // Choose your desired font size here
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal.shade50,
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _sections.length,
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ChoiceChip(
                  label: Text(_sections[index]['title']),
                  selected: _selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedIndex = selected ? index : _selectedIndex;
                    });
                  },
                  backgroundColor: Colors.teal.shade100,
                  selectedColor: Colors.teal,
                  labelStyle: TextStyle(
                    color: _selectedIndex == index ? Colors.white : Colors.teal,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: _sections[_selectedIndex]['content'].length,
                itemBuilder: (context, index) {
                  final question =
                      _sections[_selectedIndex]['content'][index]['question'];
                  final answer =
                      _sections[_selectedIndex]['content'][index]['answer'];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 2,
                    child: ExpansionTile(
                      tilePadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      title: Text(
                        question,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            answer,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
