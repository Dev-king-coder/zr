import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/widgets/dashboard_cardtile.dart';

class DailyActivities extends StatelessWidget {
  const DailyActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Card(
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
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200"),
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
    );
  }
}
