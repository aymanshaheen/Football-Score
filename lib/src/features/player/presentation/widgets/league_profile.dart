import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:flutter/material.dart';

class LeagueInfo extends StatelessWidget {
  final PlayerStatsInfo? playerStatsInfo;

  const LeagueInfo({super.key, required this.playerStatsInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: R.sH(context, 30),
          width: R.sW(context, 40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                playerStatsInfo!.statisticsInfo[0].league.logo,
              ),
            ),
          ),
        ),
        Text(
          playerStatsInfo!.statisticsInfo[0].league.name,
          style: TextStyle(
            color: AppColors.white70,
            fontSize: R.sW(context, 14),
          ),
        ),
      ],
    );
  }
}
