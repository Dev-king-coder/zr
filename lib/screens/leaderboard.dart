import 'package:flutter/material.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/widgets/leaderboardranking.dart';
import 'package:zr/widgets/leaderboardtile.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: LedaerBoradRanking(
                      image: "https://picsum.photos/200",
                      name: "John Doe",
                      points: "1100",
                      height: 50,
                      maxheight: 150,
                      rank: "3",
                    ),
                  ),
                  Expanded(
                    child: LedaerBoradRanking(
                      image: "https://picsum.photos/210",
                      name: "John Doe",
                      points: "1300",
                      height: 100,
                      maxheight: 150,
                      rank: "2",
                    ),
                  ),
                  Expanded(
                    child: LedaerBoradRanking(
                      image: "https://picsum.photos/205",
                      name: "John Doe",
                      points: "1500",
                      height: 150,
                      maxheight: 150,
                      rank: "1",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: CustomTheme.theme,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage("https://picsum.photos/215"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Points:\n200",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Level:\nRookie",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Rank:\n143",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  LeaderBoardTile(
                    rank: '04',
                    name: 'John Doe',
                    points: '940',
                  ),
                  LeaderBoardTile(
                    rank: '05',
                    name: 'John Doe',
                    points: '910',
                  ),
                  LeaderBoardTile(
                    rank: '06',
                    name: 'John Doe',
                    points: '860',
                  ),
                  LeaderBoardTile(
                    rank: '07',
                    name: 'John Doe',
                    points: '820',
                  ),
                  LeaderBoardTile(
                    rank: '08',
                    name: 'John Doe',
                    points: '740',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
