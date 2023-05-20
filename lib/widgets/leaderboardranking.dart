import 'package:flutter/material.dart';
import 'package:zr/helpers/colors.dart';

class LedaerBoradRanking extends StatelessWidget {
  final String image;
  final String name;
  final String points;
  final double height;
  final double maxheight;
  final String rank;
  const LedaerBoradRanking({
    required this.image,
    required this.name,
    required this.points,
    required this.maxheight,
    required this.height,
    required this.rank,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: maxheight - height,
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(image),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(name),
        Text(
          points,
          style: const TextStyle(fontSize: 8),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: height,
          width: 50,
          decoration: BoxDecoration(
            color: CustomTheme.themeAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text(rank)),
        )
      ],
    );
  }
}
