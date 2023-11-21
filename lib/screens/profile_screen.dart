import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final questions = [
    {
      'question': 'ವೈಯಕ್ತಿಕ ವಿವರಗಳು',
      'answer':
          ' ಸುಮತಿ ಎಸ್ \n DOB: 10-10-1995 \n ವಯಸ್ಸು: 28y 1m \n ತೂಕ: 168 lb \n ಎತ್ತರ: 5.1 ft'
    },
    {
      'question': 'ಆರೋಗ್ಯ ವಿವರಗಳು',
      'answer':
          ' ಪ್ರಸ್ತುತ ಔಷಧಿಗಳು: ಫೋಲಿಕ್ ಆಸಿಡ್, ಕೆಟೋರೊಲಾಕ್ (ಅಕ್ಯುಲರ್) \n ರಕ್ತದೊತ್ತಡ: 121/75 \n ನಾಡಿ: 67 ಬಿಪಿಎಂ \n ಟಿಪ್ಪಣಿಗಳು: ರೋಗಿಯು ಸುಮಾರು ಎರಡು ಮೂರು ತಿಂಗಳ ಹಿಂದೆ ಮುಖದ ಅಸ್ವಸ್ಥತೆಯೊಂದಿಗೆ ತೀವ್ರ ಸೈನುಟಿಸ್ ಅನ್ನು ಹೊಂದಿದ್ದ., ಮೂಗಿನ ದಟ್ಟಣೆ, ಕಣ್ಣು ನೋವು ಮತ್ತು ಪೊಟ್ನಾಸಲ್ ಹನಿ ಲಕ್ಷಣಗಳು. \n ಲ್ಯಾಬ್ ಫಲಿತಾಂಶಗಳು: ಎಕ್ಸ್-ರೇ, CT'
    }
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ವೈಯಕ್ತಿಕ ವಿವರ",
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
