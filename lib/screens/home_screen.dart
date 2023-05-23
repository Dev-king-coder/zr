import 'package:flutter/material.dart';

import 'package:zr/components/dashboard/daily.dart';
import 'package:zr/components/dashboard/monthly.dart';
import 'package:zr/components/dashboard/weekly.dart';
import 'package:zr/helpers/colors.dart';

class Dashbaord extends StatefulWidget {
  static const routeName = '/dashboard';
  const Dashbaord({super.key});

  @override
  State<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          backgroundColor: grey,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            "Welcome, Rounak",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/profile'),
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
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: const EdgeInsets.all(5.0),
                        indicator: BoxDecoration(
                          color: CustomTheme.theme,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.normal),
                        tabs: const [
                          Tab(text: 'Daily'),
                          Tab(text: 'Weekly'),
                          Tab(text: 'Monthly'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 2,
                  ),
                  width: double.infinity,

                  // color: Colors.red,
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      DailyActivities(),
                      WeeklyActivities(),
                      MonthlyActivities()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
