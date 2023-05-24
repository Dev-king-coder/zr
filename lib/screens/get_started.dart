import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zr/helpers/colors.dart';

class GetStarted extends StatefulWidget {
  static const routeName = '/get_started';
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final _formKey = GlobalKey<FormState>();
  var task = '';
  var days = '';
  var hours = '';

  void submitData() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'numTask': 1,
        'task': task,
        'days': days,
        'hours': hours,
      });
    } catch (e) {}
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Let's take the new step to your learing Journey...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tell us what you want to learn...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.trim().isEmpty || value.length < 10) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: ((newValue) {
                          task = newValue!;
                        }),
                        decoration: InputDecoration(
                          labelText: 'Goal',
                          hintText: 'Eg: Basics of Flutter',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomTheme.theme,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "How much time do you want to give to it...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                try {
                                  if (value!.isEmpty || int.parse(value) < 3) {
                                    return 'Please enter number of days';
                                  }
                                  return null;
                                } catch (e) {
                                  print(e);
                                }
                                return null;
                              },
                              onSaved: ((newValue) {
                                days = newValue!;
                              }),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Days',
                                hintText: 'Eg: 30',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: grey,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomTheme.theme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                // ignore: prefer_is_empty
                                try {
                                  if (value!.isEmpty || int.parse(value) <= 0) {
                                    return 'Please enter number of hours';
                                  }
                                  return null;
                                } catch (e) {
                                  print(e);
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                hours = newValue!;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Hours',
                                hintText: 'Hours Per Day. Eg: 1',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: grey,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomTheme.theme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButtonTheme(
                        data: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            backgroundColor: CustomTheme.themeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: submitData,
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: CustomTheme.theme,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
