import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:zr/screens/home_screen.dart';
import 'package:zr/screens/onboarding/screen1.dart';

class ScreenInitializer extends StatelessWidget {
  const ScreenInitializer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('waiting');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // TODO: Add Dashboard screen
        if (snapshot.hasData) {
          print('user is logged in through screen initializer');
          return const HomeScreen();
        }
        return const ScreenOne();
      },
    );
  }
}
