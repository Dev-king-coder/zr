import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zr/helpers/colors.dart';

class LeaderBoardTile extends StatelessWidget {
  final String rank;
  final String name;
  final String points;
  const LeaderBoardTile({
    required this.rank,
    required this.name,
    required this.points,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        rank,
        style: const TextStyle(fontSize: 30),
      ),
      title: Text(name),
      subtitle: Text(
        'Rank: $points',
        style: const TextStyle(fontSize: 10),
      ),
      trailing: const FaIcon(
        FontAwesomeIcons.crown,
        color: CustomTheme.theme,
        size: 20,
      ),
    );
  }
}
