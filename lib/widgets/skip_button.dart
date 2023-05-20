import 'package:flutter/material.dart';
import 'package:zr/colors/colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO:  Navigate to Login Screen
      // onTap: () => Navigator.popAndPushNamed(context, DashBoard.routeName),
      child: Container(
        height: 30,
        width: 55,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 14,
              color: theme,
            ),
          ),
        ),
      ),
    );
  }
}
