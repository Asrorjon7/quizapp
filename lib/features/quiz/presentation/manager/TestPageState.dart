// test_page_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_application/features/quiz/data/questions.dart';

abstract class TestPageState extends Equatable {
  const TestPageState();

  @override
  List<Object?> get props => [];
}

class TestPageInitial extends TestPageState {}

class TestInProgress extends TestPageState {
  final int questionIndex;
  final int? selectedAnswerIndex;
  final List<Color> tabColors;
  final int score;
  final int timer;
  final bool isLastQuestion;
  final Map<int, int?> selectedAnswers;

  const TestInProgress({
    required this.questionIndex,
    this.selectedAnswerIndex,
    required this.tabColors,
    required this.score,
    required this.timer,
    required this.isLastQuestion,
    required this.selectedAnswers,
  });

  @override
  List<Object?> get props => [
        questionIndex,
        selectedAnswerIndex,
        tabColors,
        score,
        timer,
        isLastQuestion,
        selectedAnswers,
      ];

}

class TestCompleted extends TestPageState {
  final int score;

  const TestCompleted(this.score);

  @override
  List<Object?> get props => [score];
}
