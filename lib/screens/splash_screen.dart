import 'package:flutter/material.dart';
import 'package:zr/helpers/dimensions.dart';
import 'package:zr/utils/screen_initializer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2500),
        () => Navigator.popAndPushNamed(context, ScreenInitializer.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.getHeight(context)*0.9,
        width: Dimensions.getWidth(context),
        child: Image.asset(
          'assets/splash-screen.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
