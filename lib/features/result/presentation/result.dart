/*

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_application/common/app_size.dart';
import 'package:test_application/features/quiz/data/questions.dart';
import 'package:test_application/features/quiz/presentation/mainbutton.dart';
import 'package:test_application/features/quiz/presentation/option_page.dart';
import 'package:test_application/features/quiz/presentation/quizui.dart';

import '../../../common/Assets.dart';

class ResultPage extends StatelessWidget {


  final int score;
   double scorePercentage = 0.9; // Change this value to 0.05 or 0.5 for different scores
   int correctAnswers = 18;
   int incorrectAnswers = 2;
  ResultPage({super.key,  required this.score});

  @override
  Widget build(BuildContext context) {

    correctAnswers = score;
    incorrectAnswers = questions.length-correctAnswers;

    //scorePercentage = correctAnswers/incorrectAnswers;
    scorePercentage = incorrectAnswers != 0 ? correctAnswers / incorrectAnswers : 1.0;


    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(

            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white),
            ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCircularIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'Yakunlandi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      scorePercentage >= 0.6
                          ? 'Sizga 1 ball taqdim etildi'
                          : 'Afsuski sizga ball taqdim etilmadi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ja\'mi to\'plangan ballaringiz soni: 0 ta',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Umumiy testlar soni: 20',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16),
                    _buildResultRow(),
                    SizedBox(height: 16),
                    _buildTimeRow(),
                    SizedBox(height: 16),
                    _buildRetryButton(context),
                    SizedBox(height: 8),
                    _buildExitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularIndicator() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: CircularProgressIndicator(
              value: scorePercentage,
              strokeWidth: 8,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                scorePercentage >= 0.6
                    ? Colors.green
                    : scorePercentage >= 0.3
                    ? Colors.orange
                    : Colors.red,
              ),
            ),
          ),
          Text(
            '${(scorePercentage * 100).toInt()}%',
            style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:
            scorePercentage >= 0.6
                ? Colors.green
                : scorePercentage >= 0.3
                ? Colors.orange
                : Colors.red,),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildResultBox('$correctAnswers', 'To\'g\'ri javob', Colors.green[100]!,Color(0xFF00D856)),
        _buildResultBox('$incorrectAnswers', 'Noto\'g\'ri javob', Colors.red[100]!,Color(0xFFEB5757)),
      ],
    );
  }

  Widget _buildResultBox(String value, String label, Color color,Color textColor) {
    return Container(
      width: 170.w,
      height: 110.h,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:textColor ),

          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer, color: Colors.orange),
        SizedBox(width: 8),
        Text(
          '20:00 / 11:34',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRetryButton(BuildContext context) {
    return
    //MainButton(text: "Qayta urinish", onPressed: (){}, color: Color(0xFF006FE5));
      ElevatedButton(
        onPressed: (){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => TestPage(),
            ),
                (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 56.h),
            backgroundColor:Color(0xFF006FE5) ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.o))),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Text(
                  "Qayta urinish",
                  style: TextStyle(
                      fontSize: 13.o,
                      color: Colors.white),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: SvgPicture.asset(Assets.icons.retry),
                  onPressed: null,
                )
            ),
          ],
        ),
      );



      ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => TestPage(),
            ),
              (route) => false,
        );



      },
      child: Text('Qayta urinish'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildExitButton() {
    return ElevatedButton(
      onPressed: (){
        exit(0);
      },

      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56.h),
          backgroundColor:Color(0xFFF1F3F7) ,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.o))),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Text(
                "Chiqish",
                style: TextStyle(
                    fontSize: 13.o,
                    color: Color(0xFF8192A5)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
*/
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_application/features/quiz/data/questions.dart';
import 'package:test_application/features/quiz/presentation/quizui.dart';

import '../../../common/Assets.dart';

class ResultPage extends StatelessWidget {
  final int score;
  late final double scorePercentage; // Calculate this in the constructor
  late final int correctAnswers;
  late final int incorrectAnswers;

  ResultPage({super.key, required this.score}) {
    correctAnswers = score;
    incorrectAnswers = questions.length - correctAnswers;
    scorePercentage = questions.length > 0 ? correctAnswers / questions.length : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCircularIndicator(),
                    const SizedBox(height: 16),
                    const Text(
                      'Yakunlandi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      scorePercentage >= 0.6
                          ? 'Sizga 1 ball taqdim etildi'
                          : 'Afsuski sizga ball taqdim etilmadi',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Ja\'mi to\'plangan ballaringiz soni: 0 ta',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Umumiy testlar soni: 20',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16),
                    _buildResultRow(),
                    const SizedBox(height: 16),
                    _buildTimeRow(),
                    const SizedBox(height: 16),
                    _buildRetryButton(context),
                    const SizedBox(height: 8),
                    _buildExitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularIndicator() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: CircularProgressIndicator(
              value: scorePercentage,
              strokeWidth: 8,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                scorePercentage >= 0.6
                    ? Colors.green
                    : scorePercentage >= 0.3
                    ? Colors.orange
                    : Colors.red,
              ),
            ),
          ),
          Text(
            '${(scorePercentage * 100).toInt()}%',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: scorePercentage >= 0.6
                  ? Colors.green
                  : scorePercentage >= 0.3
                  ? Colors.orange
                  : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildResultBox(
          '$correctAnswers',
          'To\'g\'ri javob',
          Colors.green[100]!,
          const Color(0xFF00D856),
        ),
        _buildResultBox(
          '$incorrectAnswers',
          'Noto\'g\'ri javob',
          Colors.red[100]!,
          const Color(0xFFEB5757),
        ),
      ],
    );
  }

  Widget _buildResultBox(String value, String label, Color color, Color textColor) {
    return Container(
      width: 170.0, // Replace with fixed values
      height: 110.0, // Replace with fixed values
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.timer, color: Colors.orange),
        SizedBox(width: 8),
        Text(
          '20:00 / 11:34',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRetryButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => TestPage(),
          ),
              (route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56.0),
        backgroundColor: const Color(0xFF006FE5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            "Qayta urinish",
            style: TextStyle(fontSize: 13.0, color: Colors.white),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(Assets.icons.retry),
          ),
        ],
      ),
    );
  }

  Widget _buildExitButton() {
    return ElevatedButton(
      onPressed: () {
        exit(0); // Use cautiously in Flutter apps
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56.0),
        backgroundColor: const Color(0xFFF1F3F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        "Chiqish",
        style: TextStyle(fontSize: 13.0, color: Color(0xFF8192A5)),
      ),
    );
  }
}
