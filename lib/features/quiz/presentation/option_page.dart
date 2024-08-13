import 'package:flutter/material.dart';
class QuestionPage extends StatefulWidget {

  final String option;
  final String text;
  final Color color;
  final VoidCallback onTap;
  final String correctAnswer;

  const QuestionPage({super.key, required this.option, required this.text, required this.color,required this.correctAnswer, required this.onTap});
  @override
  _QuestionPageState createState() => _QuestionPageState();


}

class _QuestionPageState extends State<QuestionPage> {
  String? selectedAnswer;
  bool showCorrectAnswer = false;

  final String correctAnswer = "C";

  void selectAnswer(String answer) {
    if (selectedAnswer == null) {
      setState(() {
        selectedAnswer = answer;
        if (answer != correctAnswer) {
          showCorrectAnswer = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Choice Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OptionTile(
              option: 'A',
              text: 'Mijoz servis markaziga olib boradi, servis bepul.',
              color: getColor('A'),
              textColor: getColorText('A'),
              onTap: () => selectAnswer('A'),

            ),
            OptionTile(
              option: 'B',
              text: 'Servis markazi mijozni uyiga keladi, servis xizmati pullik bo’ladi.',
              color: getColor('B'),
              textColor: getColorText('B'),
              onTap: () => selectAnswer('B'),
            ),
            OptionTile(
              option: 'C',
              text: 'Mijozni uyiga servis markazi xizmat ko’rsatish uchun keladi, xizmat bepul faqat zavod tomonidan nosozlik chiqsa.',
              color: getColor('C'),
              textColor: getColorText('C'),
              onTap: () => selectAnswer('C'),
            ),
            OptionTile(
              option: 'D',
              text: 'Barcha javoblar noto’g’ri',
              color: getColor('D'),
              textColor: getColorText('D'),
              onTap: () => selectAnswer('D'),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(String option) {
    if (selectedAnswer == option) {
      return selectedAnswer == correctAnswer ? Colors.green : Colors.red;
    } else if (showCorrectAnswer && option == correctAnswer) {
      return Colors.green;
    } else {
      return Colors.grey.shade200;
    }
  }
  Color getColorText(String option) {
    if (selectedAnswer == option) {
      return selectedAnswer == correctAnswer ? Colors.white : Colors.white;
    } else if (showCorrectAnswer && option == correctAnswer) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}

class OptionTile extends StatelessWidget {
  final String option;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  OptionTile({
    required this.option,
    required this.text,
    required this.color,
    required this.onTap,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          '$option. $text',
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
