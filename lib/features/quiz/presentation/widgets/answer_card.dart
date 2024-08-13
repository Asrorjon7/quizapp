import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: selectedAnswerIndex != null
          // if one option is chosen
          ? Container(
              height: 70,
              padding: const EdgeInsets.all(16.0),
              decoration: isCorrectAnswer
                  ? boxCorrectDecoration()
                  : isWrongAnswer
                      ? boxWrongDecoration()
                      : boxDefaultDecoration(),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style:
                      isCorrectAnswer ?
                      const TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ):isWrongAnswer ? const TextStyle(
                        fontSize: 16,
                          color: Colors.white
                      ) :const TextStyle(
                        fontSize: 16,
                          color: Colors.black

                      ),
                    ),
                  ),

                ],
              ),
            )
          // If no option is selected
          : Container(
              height: 70,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

BoxDecoration boxCorrectDecoration() => BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(8.0),
    );

BoxDecoration boxWrongDecoration() => BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(8.0),
    );

BoxDecoration boxDefaultDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    );

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
