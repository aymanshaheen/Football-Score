import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../../../soccer/domain/entities/team_rank.dart';

class StandingsItem extends StatelessWidget {
  final TeamRank teamRank;
  final Team? team;

  const StandingsItem({super.key, required this.teamRank, this.team});

  @override
  Widget build(BuildContext context) {
    List<String> headersNumbers = [
      "${teamRank.stats.played}",
      "${teamRank.stats.win}",
      "${teamRank.stats.draw}",
      "${teamRank.stats.lose}",
      "${teamRank.stats.scored}",
      "${teamRank.stats.received}",
      "${teamRank.goalsDiff}",
      "${teamRank.points}",
    ];
    return Container(
      color: team == null || teamRank.team.id != team!.id
          ? AppColors.darkgrey
          : AppColors.grey.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: R.sH(context, 11), horizontal: R.sW(context, 14)),
        child: Row(
          children: [
            SizedBox(
              width: R.sW(context, 160),
              child: Row(
                children: [
                  SizedBox(
                    width: R.sW(context, 18),
                    child: Text(
                      teamRank.rank.toString(),
                      style: TextStyle(fontSize: R.F(context, 12)),
                    ),
                  ),
                  Image(
                    image: NetworkImage(
                      teamRank.team.logo,
                    ),
                    width: R.sW(context, 20),
                    height: R.sH(context, 20),
                  ),
                  SizedBox(width: R.sW(context, 5)),
                  Flexible(
                    child: Text(
                      teamRank.team.name,
                      style: TextStyle(
                        fontSize: R.F(context, 12),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  headersNumbers.length,
                  (index) => SizedBox(
                    width: R.sW(context, 20),
                    child: Text(
                      headersNumbers[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: R.F(context, 11)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StandingsHeaders extends StatelessWidget {
  const StandingsHeaders({super.key});
  static const List<String> _headers = [
    "PL",
    "W",
    "D",
    "L",
    "GF",
    "GA",
    "GD",
    "Pts"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10, horizontal: AppPadding.p15),
      child: Row(
        children: [
          SizedBox(
            width: R.sW(context, 158),
            child: Text("#", style: TextStyle(fontSize: R.F(context, 16))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(
                _headers.length,
                (index) => SizedBox(
                  width: R.sW(context, 20),
                  child: Text(
                    _headers[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: R.F(context, 11)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
