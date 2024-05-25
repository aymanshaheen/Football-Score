import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/presentation/widgets/player_info_row_widget.dart';
import 'package:flutter/material.dart';

class PlayerInfoCard extends StatelessWidget {
  final PlayerStatsInfo? playerStatsInfo;

  const PlayerInfoCard({super.key, required this.playerStatsInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: R.sW(context, 25), vertical: R.sH(context, 15)),
      child: Column(
        children: [
          PlayerInfoRow(
            context: context,
            value1: playerStatsInfo!.playerInfo!.height.toString(),
            label1: 'Height',
            value2: playerStatsInfo!.playerInfo!.weight,
            label2: 'Weight',
            value3: "${playerStatsInfo!.playerInfo!.age} Years",
            label3: playerStatsInfo!.playerInfo!.birth.date,
          ),
          SizedBox(
            height: R.sH(context, 20),
          ),
          PlayerInfoRow(
            context: context,
            value1:
                playerStatsInfo!.statisticsInfo[0].games.position.toString(),
            label1: 'Position',
            value2: playerStatsInfo!.playerInfo!.nationality,
            label2: 'Country',
            value3: '                 ',
            label3: '',
          ),
        ],
      ),
    );
  }
}
