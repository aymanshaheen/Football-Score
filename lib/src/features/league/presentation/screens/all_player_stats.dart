import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/circular_image.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:flutter/material.dart';

class AllPlayersPage extends StatelessWidget {
  final String title;
  final List<PlayerTopScorers> players;
  final String statisticType;

  const AllPlayersPage(
      {super.key,
      required this.players,
      required this.title,
      required this.statisticType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 16),
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(R.sW(context, 15)),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: players.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.player,
                  arguments: players[index].id.toString(),
                );
              },
              child: Container(
                padding: EdgeInsets.all(R.sW(context, 5.0)),
                margin: EdgeInsets.only(bottom: R.sH(context, 10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircularImageBuilder(
                            photo: players[index].photo, height: 45, width: 45),
                        SizedBox(width: R.sW(context, 10)),
                        Text(
                          players[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: R.F(context, 14),
                                  color: AppColors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: R.sW(context, 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularImageBuilder(
                              photo: players[index].statistics.team.logo,
                              height: 30,
                              width: 30),
                          Text(
                            statisticType == 'goals'
                                ? players[index]
                                    .statistics
                                    .goals
                                    .total
                                    .toString()
                                : statisticType == 'assists'
                                    ? players[index]
                                        .statistics
                                        .goals
                                        .assists
                                        .toString()
                                    : statisticType == 'redCards'
                                        ? players[index]
                                            .statistics
                                            .cards
                                            .red
                                            .toString()
                                        : players[index]
                                            .statistics
                                            .cards
                                            .yellow
                                            .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: R.F(context, 14),
                                    color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
