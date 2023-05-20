// ignore: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zr/helpers/colors.dart';

import '../../utils/gsign_auth.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isSignedIn
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : InkWell(
                onTap: () async {
                  setState(() {
                    _isSignedIn = true;
                  });
                  User? user =
                      await GSignAuth.signInWithGoogle(context: context);
                  setState(() {
                    _isSignedIn = false;
                  });

                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sign in successful!"),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.themeAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        'lib/assets/images/google_logo.png',
                      ),
                    ),
                  ),
                ),
              ));
  }
}
