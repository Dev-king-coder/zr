import 'package:flutter/material.dart';
import 'package:zr/helpers/colors.dart';

class DashboardCardTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  const DashboardCardTile({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: CustomTheme.theme[300],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
