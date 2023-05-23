import 'package:flutter/material.dart';

class PreviousActivities extends StatelessWidget {
  final String date;
  final String day;
  final String progress;
  const PreviousActivities({
    required this.date,
    required this.day,
    required this.progress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        date,
        style: const TextStyle(fontSize: 20),
      ),
      title: Text(
        day,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: Text(
        progress,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
