import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/screens/leaderboard.dart';
import 'package:zr/screens/profile.dart';
import 'package:zr/widgets/dashboard_cardtile.dart';
// import 'package:temp/dashboard/daily.dart';
// import 'package:temp/dashboard/monthly.dart';
// import 'package:temp/dashboard/weekly.dart';

class Dashbaord extends StatefulWidget {
  static const routeName = '/dashboard';
  const Dashbaord({super.key});

  @override
  State<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> with TickerProviderStateMixin {
  String accStatus = '';

  firestoreData() async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection('users').doc(user!.uid).get();
    setState(() {
      accStatus = doc.data()!['accCreated'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: grey,
          elevation: 0,
          centerTitle: false,
          title: Text(
            accStatus == 'standard' && user!.displayName == null
                ? 'Welcome ${user!.email!.split('@')[0]}'
                : 'Welcome ${user?.displayName?.split(' ')[0]}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, Profile.routeName),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network('https://picsum.photos/200'),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Activities',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        CircularStepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 75,
                          stepSize: 10,
                          selectedColor: CustomTheme.theme,
                          unselectedColor: Colors.grey[200],
                          padding: 0,
                          width: 250,
                          height: 250,
                          selectedStepSize: 10,
                          roundedCap: (_, __) => true,
                        ),
                        const SizedBox(
                          height: 250,
                          width: 250,
                          child: Center(
                              child: Text(
                            '75%\n Complete',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, LeaderBoard.routeName),
                      child: Card(
                        shape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          10,
                        ),
                        color: CustomTheme.theme,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "https://picsum.photos/200"),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Rounak Agrawal",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Points:\n1000",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Level:\nVetreran",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Rank:\n3",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCardTile(
                            title: 'My Tasks',
                            icon: Icons.task,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DashboardCardTile(
                            title: 'Add Task',
                            icon: Icons.add_task,
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCardTile(
                            title: 'My Goals',
                            icon: FontAwesomeIcons.bullseye,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DashboardCardTile(
                            title: 'View Roadmap',
                            icon: FontAwesomeIcons.map,
                            onTap: () {},
                          ),
                        )
                      ],
                    )
                  ],
                )
                // Container(
                //   width: MediaQuery.of(context).size.width * .95,
                //   height: 45,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: TabBar(
                //     controller: tabController,
                //     labelColor: Colors.white,
                //     unselectedLabelColor: Colors.grey,
                //     indicatorPadding: const EdgeInsets.all(5.0),
                //     indicator: BoxDecoration(
                //       color: theme,
                //       borderRadius: BorderRadius.circular(40),
                //     ),
                //     labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                //     unselectedLabelStyle:
                //         const TextStyle(fontWeight: FontWeight.normal),
                //     tabs: const [
                //       Tab(text: 'Daily'),
                //       Tab(text: 'Weekly'),
                //       Tab(text: 'Monthly'),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height,
                //   // color: Colors.red,
                //   child: TabBarView(
                //     controller: tabController,
                //     children: const [
                //       DailyActivities(),
                //       WeeklyActivities(),
                //       MonthlyActivities()
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
