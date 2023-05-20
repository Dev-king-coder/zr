import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zr/screens/onboarding/screen1.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';

class ScreenInitializer extends StatelessWidget {
  const ScreenInitializer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        // TODO: Add Dashboard screen
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const ScreenOne();
      },
    );
  }
}
