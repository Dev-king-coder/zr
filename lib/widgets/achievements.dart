import 'package:flutter/material.dart';
import 'package:zr/helpers/colors.dart';

class ProfileAchievements extends StatelessWidget {
  final String value;
  final String title;
  const ProfileAchievements({
    required this.value,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: CustomTheme.themeAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
