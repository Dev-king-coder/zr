import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/screens/get_started.dart';
import '../../../utils/gsign_auth.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool _isSignedIn = false;
  int numTask=0;

  void checkTask() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.data()!['numTask'] == 0) {
        numTask = 0;
      }
    });
  }

  void redirect(User? user) async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': user.displayName,
        'imageUrl': user.photoURL,
        'email': user.email,
        'accCreated': 'google',
        'numTask': 0
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign in successful!"),
        ),
      );
      checkTask();
      print('numTask: $numTask');
      if (numTask == 0) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(GetStarted.routeName);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isSignedIn
            ? const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        CustomTheme.theme) //add primary colour to it
                    ))
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
                  redirect(user);
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
                        'assets/google_logo.png',
                      ),
                    ),
                  ),
                ),
              ));
  }
}
