import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:zr/widgets/chart.dart';
import 'package:zr/widgets/previousactivities.dart';

class WeeklyActivities extends StatelessWidget {
  const WeeklyActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30.0),
          constraints: const BoxConstraints(
            maxHeight: 400.0,
            maxWidth: 600.0,
          ),
          child: Chart(
            layers: ChartData.weekly(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
              bottom: 12.0,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Previous Activities",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const PreviousActivities(
          date: "03",
          day: "Monday",
          progress: "50%",
        ),
        const PreviousActivities(
          date: "04",
          day: "Tuesday",
          progress: "70%",
        ),
        const PreviousActivities(
          date: "05",
          day: "Wednesday",
          progress: "60%",
        ),
        const PreviousActivities(
          date: "06",
          day: "Thursday",
          progress: "30%",
        ),
        const PreviousActivities(
          date: "07",
          day: "Friday",
          progress: "20%",
        ),
      ],
    );
  }
}
