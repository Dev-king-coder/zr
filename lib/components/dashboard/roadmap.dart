import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/api_call.dart';

class RoadMap extends StatefulWidget {
  const RoadMap({super.key});
  static const routeName = '/roadmap';
  @override
  State<RoadMap> createState() => _RoadMapState();
}

class _RoadMapState extends State<RoadMap> {
  String? task;
  String? days;
  String? hours;
  String? roadmap;
  var wait = true;

  void getDataFromAI() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = documentSnapshot.data();
    task = data!['task'];
    days = data['days'];
    hours = data['hours'];
    String prompt =
        "Generate a quiz of 3 practical questions if the task is practical and does not involve much techniqality,Generate 4 to 5 technical questions if the task is technical.If the task involves something that is related to planning an event that does not require quizzing just generate 'No Quiz for this Task, check roadmap section for more info'. Some Rules -1) Generate in json format with question as a key and value, dont put '\n' in json 2) Identify the type of task the user is wanting to complete, do not mix the types and generate requests accordingly.Task-$task in $days days and $hours hours";
    String? resp = await ApiCall().postData(prompt);
    if (resp == null) {
      return;
    }
    String? response = resp.split('\n  \\')[0];
    setState(() {
      roadmap = response;
      wait = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roadmap'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Roadmap',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            roadmap == null
                ? const Text('Generating Roadmap...')
                : Text(
                    roadmap!,
                    style: const TextStyle(fontSize: 15),
                  ),
            const SizedBox(
              height: 20,
            ),
            wait
                ? ElevatedButton(
                    onPressed: () {
                      getDataFromAI;
                      setState(() {
                        wait = false;
                      });
                    },
                    child: const Text('Generate Roadmap'),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
