import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_application/common/app_size.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const MainButton({super.key, required this.text, required this.onPressed,required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 38.h),
          backgroundColor:color ,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.o))),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16.o,
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: SvgPicture.asset(""),
              onPressed: null,
            )
          ),
        ],
      ),
    );
  }
}
