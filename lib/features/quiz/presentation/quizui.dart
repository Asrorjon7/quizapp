
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_application/features/quiz/presentation/widgets/NavigationBar.dart';
import 'package:test_application/features/quiz/presentation/widgets/answer_card.dart';

import '../../../common/Assets.dart';
import '../../../common/app_size.dart';
import '../../result/presentation/result.dart';
import '../data/question.dart';
import '../data/questions.dart';
import 'TriangleTabIndicator.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  late List<Color> tabColors;
  late Map<int, int?> selectedAnswers;
  late TabController _tabController;
  int _start = 1200; // 20 minutes in seconds
  Timer? _timer;
  bool isLastQuestion = false;

  @override
  void initState() {
    super.initState();
    selectedAnswers = {};
    tabColors = List<Color>.filled(questions.length, Colors.white);
    _tabController = TabController(length: questions.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        questionIndex = _tabController.index;
      });
    });

    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _navigateToResult();
        _timer?.cancel();
      }
    });
  }

  void pickAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
      selectedAnswers[questionIndex] = selectedAnswerIndex;

      final question = questions[questionIndex];
      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
        tabColors[questionIndex] = Colors.green;
      } else {
        tabColors[questionIndex] = Colors.red;
      }
    });
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = selectedAnswers[questionIndex];
        _tabController.index = questionIndex;
        isLastQuestion = questionIndex == questions.length - 1;
      });
    }
  }

  void goToPreviousQuestion() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
        selectedAnswerIndex = selectedAnswers[questionIndex];
        _tabController.index = questionIndex;
        isLastQuestion = questionIndex == questions.length - 1;
      });
    }
  }

  void goToIndexQuestion(int index) {
    setState(() {
      questionIndex = index;
      selectedAnswerIndex = selectedAnswers[questionIndex];
      _tabController.index = index;
    });
  }

  String get timerText {
    final minutes = _start ~/ 60;
    final seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void _navigateToResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(score: score),
      ),
    );
  }

  void unselectedQuiz() {
    int? unansweredQuestionIndex;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == null) {
        unansweredQuestionIndex = i;
        break;
      }
    }
    if (unansweredQuestionIndex != null) {
      goToIndexQuestion(unansweredQuestionIndex);
    } else {
      _navigateToResult();
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return Scaffold(
      backgroundColor: Color(0xFFF1F3F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              sizeHor(15.h),
              _buildTestOrderRow(),
              sizeHor(20.h),
              _buildQuestionCard(question),
              SizedBox(height: 16),
              _buildAnswerList(question),
              Spacer(),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => showTestCompletionDialog(context, score),
            child: SvgPicture.asset(Assets.icons.logout),
          ),
          IconButton(
            icon: Icon(Icons.report_problem, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.nightlight_round, color: Colors.grey),
            onPressed: () {},
          ),
          _buildTimer(),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(Icons.timer, color: Colors.blue, size: 18),
            SizedBox(width: 4),
            Text(
              timerText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestOrderRow() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
      indicator: TriangleTabIndicator(color: Color(0xFF006FE5), radius: 8),
      tabs: List.generate(questions.length, (index) {
        return Tab(
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: tabColors[index],
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white),
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      }),
      onTap: (index) => goToIndexQuestion(index),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Savol:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              question.question,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerList(Question question) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: question.options.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: selectedAnswerIndex == null ? () => pickAnswer(index) : null,
          child: AnswerCard(
            currentIndex: index,
            question: question.options[index],
            isSelected: selectedAnswerIndex == index,
            selectedAnswerIndex: selectedAnswerIndex,
            correctAnswerIndex: question.correctAnswerIndex,
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons() {
    return Center(
      child: NavigationBarNextPre(
        currentIndex: questionIndex + 1,
        totalQuestions: questions.length,
        onPrevious: goToPreviousQuestion,
        onNext: () => isLastQuestion ? unselectedQuiz() : goToNextQuestion(),
      ),
    );
  }
}

void showTestCompletionDialog(BuildContext context, int score) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.help_outline, color: Colors.blue, size: 40),
            SizedBox(height: 20),
            Text(
              'Haqiqatda ham testni yakunlashni xohlaysizmi?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text(
              'Belgilanmagan test javoblari xato deb hisobga olinadi',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ResultPage(score: score)),
                  ),
                  child: Text(
                    'Qaytish',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text(
                    'Yakunlash',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
