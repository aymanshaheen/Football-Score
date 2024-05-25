import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/presentation/widgets/player_info_row_widget.dart';
import 'package:flutter/material.dart';

class PlayerStatesInfoCard extends StatelessWidget {
  final PlayerStatsInfo? playerStatsInfo;

  const PlayerStatesInfoCard({super.key, required this.playerStatsInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: R.sW(context, 30), vertical: R.sH(context, 15)),
      child: Column(
        children: [
          PlayerInfoRow(
            context: context,
            value1:
                playerStatsInfo!.statisticsInfo[0].games.appearences.toString(),
            label1: 'Matches',
            value2: playerStatsInfo!.statisticsInfo[0].games.lineups.toString(),
            label2: 'Started',
            value3: playerStatsInfo!.statisticsInfo[0].games.minutes.toString(),
            label3: "Minutes",
          ),
          SizedBox(
            height: R.sH(context, 20),
          ),
          PlayerInfoRow(
            context: context,
            value1: playerStatsInfo!.statisticsInfo[0].goals.total.toString(),
            label1: 'Goals ',
            value2: playerStatsInfo!.statisticsInfo[0].goals.assists.toString(),
            label2: 'Asists',
            value3:
                playerStatsInfo!.statisticsInfo[0].penalty.scored.toString(),
            label3: 'penalty',
          ),
        ],
      ),
    );
  }
}
