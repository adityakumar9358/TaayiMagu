import 'package:flutter/material.dart';
import 'package:haem_suraksha/utils/helper_functions.dart';

class FAQScreen extends StatefulWidget {
  FAQScreen({super.key});

  @override
  _FAQScreen createState() => _FAQScreen();
}

class _FAQScreen extends State<FAQScreen> {
  final questions = [
    {
      'question': 'Are there any foods I should avoid during pregnancy?',
      'answer':
          'There are wonderful resources online that cover healthy eating (visit Nutrition During Pregnancy, for one). What it boils down to is this: You dont want to eat something that might contain bacteria that could make you sick. Pregnant women are more likely to get very sick from bacteria in food, which can be dangerous for you and your pregnancy.  Risky foods include raw or undercooked meat, fish, and eggs. To avoid problems, cook food thoroughly and wash your hands, knives, and cutting boards after handling raw meat or fish. Avoid homemade mayonnaise and dressings that use raw eggs. Cook scrambled eggs thoroughly.  Avoid raw sprouts, including bean and alfalfa. The moist conditions they are grown in are ideal for bacteria growth. Don’t eat unpasteurized (raw) milk and cheeses, such as some feta, queso fresco, and blue cheeses. Deli meats and hot dogs should be thoroughly cooked or microwaved to kill any bacteria.Cooked seafood is a good source of omega-3 fatty acids, an important nutrient for your pregnancy. But certain fish should be avoided because they have high levels of mercury. Do not eat bigeye tuna, king mackerel, marlin, orange roughy, shark, swordfish, or tilefish. Limit white (albacore) tuna to 6 ounces or less a week. Here is a list with safer options. Also, fish caught in local rivers or lakes can be unsafe because of chemicals in the water. In my area, for example, there is mercury runoff from old gold mines. It is best to avoid eating fish caught locally unless you can check local safety information. Otherwise, eat no more than 6 ounces of it and avoid eating other fish that week.'
    },
    {
      'question': 'Can I keep drinking coffee?',
      'answer':
          'There has been research on whether caffeine increases the risk of miscarriage or preterm birth, but the results are unclear. Most experts agree it is safe to drink about one cup of coffee a day—that is 12 ounces (200 milligrams) of caffeine. Pay attention to tea, chocolate, soft drinks, and other caffeine sources when you are calculating how much you are taking in.'
    },
  ];
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
