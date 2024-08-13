import 'package:flutter/material.dart';

class NavigationBarNextPre extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationBarNextPre({
    Key? key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Adjust the padding as needed
      color: const Color(0xFFF1F3F7), // Background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF8192A5), // Gray color for the icon
            ),
            onPressed: onPrevious,
          ),
          Text(
            '$currentIndex/$totalQuestions',
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF8192A5), // Gray color for the text
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: Color(0xFF8192A5), // Gray color for the icon
            ),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
