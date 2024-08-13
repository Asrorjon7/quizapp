// test_page_event.dart
import 'package:equatable/equatable.dart';

abstract class TestPageEvent extends Equatable {
  const TestPageEvent();

  @override
  List<Object?> get props => [];
}

class StartTest extends TestPageEvent {}

class SelectAnswer extends TestPageEvent {
  final int answerIndex;

  const SelectAnswer(this.answerIndex);

  @override
  List<Object?> get props => [answerIndex];
}

class GoToNextQuestion extends TestPageEvent {}

class GoToPreviousQuestion extends TestPageEvent {}

class GoToSpecificQuestion extends TestPageEvent {
  final int questionIndex;

  const GoToSpecificQuestion(this.questionIndex);

  @override
  List<Object?> get props => [questionIndex];
}

class CompleteTest extends TestPageEvent {}
