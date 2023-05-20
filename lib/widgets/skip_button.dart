import 'package:flutter/material.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/screens/auth_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.popAndPushNamed(context, AuthScreen.routeName),
      child: Container(
        height: 30,
        width: 55,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 14,
              color: CustomTheme.theme,
            ),
          ),
        ),
      ),
    );
  }
}
