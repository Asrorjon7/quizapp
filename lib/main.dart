import 'package:flutter/material.dart';
import 'package:test_application/features/quiz/presentation/option_page.dart';
import 'package:test_application/features/quiz/presentation/quizui.dart';
import 'package:test_application/features/result/presentation/result.dart';

import 'features/quiz/presentation/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TestPage(),
    );
  }
}

