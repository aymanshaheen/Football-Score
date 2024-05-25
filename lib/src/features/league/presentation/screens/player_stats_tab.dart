import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/circular_image.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/presentation/screens/all_player_stats.dart';
import 'package:flutter/material.dart';

class PlayerStats extends StatefulWidget {
  final List<PlayerTopScorers> topGoals;
  final List<PlayerTopScorers> topAsists;
  final List<PlayerTopScorers> topRedCards;
  final List<PlayerTopScorers> topYellowCards;

  const PlayerStats({
    super.key,
    required this.topGoals,
    required this.topAsists,
    required this.topRedCards,
    required this.topYellowCards,
  });

  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TopPlayersWidget(
              title: 'Top scorer',
              statisticType: "goals",
              players: widget.topGoals,
            ),
            TopPlayersWidget(
              title: 'Assists',
              statisticType: "assists",
              players: widget.topAsists,
            ),
            TopPlayersWidget(
              title: 'Red cards',
              statisticType: "redCards",
              players: widget.topRedCards,
            ),
            TopPlayersWidget(
              title: 'Yellow card',
              statisticType: "yellowCards",
              players: widget.topYellowCards,
            ),
          ],
        ),
      ),
    );
  }
}

class TopPlayersWidget extends StatelessWidget {
  final String title;
  final List<PlayerTopScorers> players;
  final String statisticType;

  const TopPlayersWidget(
      {super.key,
      required this.title,
      required this.players,
      required this.statisticType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(R.sP(context, 10)),
      margin: EdgeInsets.only(bottom: R.sP(context, 10)),
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(R.sR(context, 10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllPlayersPage(
                    players: players,
                    title: title,
                    statisticType: statisticType,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: R.F(context, 16),
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: R.sW(context, 16),
                ),
              ],
            ),
          ),
          SizedBox(height: R.sH(context, 15)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: players.length > 3 ? 3 : players.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.player,
                    arguments: players[index].id.toString(),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(R.sW(context, 5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircularImageBuilder(
                              photo: players[index].photo,
                              height: 30,
                              width: 30),
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
        ],
      ),
    );
  }
}
