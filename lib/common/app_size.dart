import 'package:flutter/material.dart';

double height = 1, width = 1, arithmetic = 1;

extension ExtSize on num {
  double get h => this * height;

  double get w => this * width;

  double get o => this * arithmetic;
}

Widget sizeHor(double height) => SizedBox(height: height);

Widget sizeVer(double width) => SizedBox(width: width);
