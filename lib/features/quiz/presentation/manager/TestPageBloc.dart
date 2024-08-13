// test_page_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_application/features/quiz/data/questions.dart';
import 'TestPageEvent.dart';
import 'TestPageState.dart';

class TestPageBloc extends Bloc<TestPageEvent, TestPageState> {
  Timer? _timer;
  final int _startTime = 1200; // 20 minutes
  int _timerCount = 1200;

  TestPageBloc() : super(TestPageInitial()) {
    on<StartTest>(_onStartTest);
    on<SelectAnswer>(_onSelectAnswer);
    on<GoToNextQuestion>(_onGoToNextQuestion);
    on<GoToPreviousQuestion>(_onGoToPreviousQuestion);
    on<GoToSpecificQuestion>(_onGoToSpecificQuestion);
    on<CompleteTest>(_onCompleteTest);
  }

  void _onStartTest(StartTest event, Emitter<TestPageState> emit) {
    _startTimer(emit);
    emit(TestInProgress(
      questionIndex: 0,
      tabColors: List<Color>.filled(questions.length, Colors.white),
      score: 0,
      timer: _startTime,
      isLastQuestion: false,
      selectedAnswers: {},
    ));
  }

  void _onSelectAnswer(SelectAnswer event, Emitter<TestPageState> emit) {
    final state = this.state as TestInProgress;
    final question = questions[state.questionIndex];
    int score = state.score;
    List<Color> tabColors = List.from(state.tabColors);

    if (event.answerIndex == question.correctAnswerIndex) {
      score++;
      tabColors[state.questionIndex] = Colors.green;
    } else {
      tabColors[state.questionIndex] = Colors.red;
    }

    final selectedAnswers = Map<int, int?>.from(state.selectedAnswers)
      ..[state.questionIndex] = event.answerIndex;

   /* emit(state.copyWith(
      selectedAnswerIndex: event.answerIndex,
      score: score,
      tabColors: tabColors,
      selectedAnswers: selectedAnswers,
    ));*/
  }

  void _onGoToNextQuestion(GoToNextQuestion event, Emitter<TestPageState> emit) {
    final state = this.state as TestInProgress;
    if (state.questionIndex < questions.length - 1) {
      final isLastQuestion = state.questionIndex == questions.length - 2;

     /* emit(state.copyWith(
        questionIndex: state.questionIndex + 1,
        selectedAnswerIndex: state.selectedAnswers[state.questionIndex + 1],
        isLastQuestion: isLastQuestion,
      ));*/
    }
  }

  void _onGoToPreviousQuestion(
      GoToPreviousQuestion event, Emitter<TestPageState> emit) {
    final state = this.state as TestInProgress;
    if (state.questionIndex > 0) {
    /*  emit(state.copyWith(
        questionIndex: state.questionIndex - 1,
        selectedAnswerIndex: state.selectedAnswers[state.questionIndex - 1],
      ));*/
    }
  }

  void _onGoToSpecificQuestion(
      GoToSpecificQuestion event, Emitter<TestPageState> emit) {
    final state = this.state as TestInProgress;
   /* emit(state.copyWith(
      questionIndex: event.questionIndex,
      selectedAnswerIndex: state.selectedAnswers[event.questionIndex],
    ));*/
  }

  void _onCompleteTest(CompleteTest event, Emitter<TestPageState> emit) {
    _timer?.cancel();
    final state = this.state as TestInProgress;
    emit(TestCompleted(state.score));
  }

  void _startTimer(Emitter<TestPageState> emit) {
    _timerCount = _startTime;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _timerCount--;
      if (_timerCount <= 0) {
        add(CompleteTest());
        timer.cancel();
      } else {
    //   emit((state as TestInProgress).copyWith(timer: _timerCount));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
