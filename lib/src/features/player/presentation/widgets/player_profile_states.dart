import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:flutter/material.dart';

class PlayerProfileStats extends StatelessWidget {
  final PlayerStatsInfo? playerStatsInfo;

  const PlayerProfileStats({super.key, required this.playerStatsInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlayerInfoColumn(
          value:
              playerStatsInfo!.statisticsInfo[0].games.appearences.toString(),
          label: "Matches",
        ),
        PlayerInfoColumn(
          value: playerStatsInfo!.statisticsInfo[0].goals.total.toString(),
          label: "Goals",
        ),
        PlayerInfoColumn(
          value: playerStatsInfo!.statisticsInfo[0].goals.assists.toString(),
          label: "Assists",
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: R.sW(context, 8),
                vertical: R.sH(context, 1),
              ),
              decoration: BoxDecoration(
                color: double.parse(playerStatsInfo!
                            .statisticsInfo[0].games.rating
                            .substring(0, 3)) >
                        7
                    ? AppColors.green
                    : AppColors.white50,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                playerStatsInfo!.statisticsInfo[0].games.rating.substring(0, 3),
                style: TextStyle(
                  fontSize: R.sW(context, 14),
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Rating",
              style: TextStyle(
                fontSize: R.sW(context, 10),
                fontWeight: FontWeight.w400,
                color: AppColors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PlayerInfoColumn extends StatelessWidget {
  final String value;
  final String label;

  const PlayerInfoColumn({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: R.sW(context, 14),
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: R.sW(context, 10),
            fontWeight: FontWeight.w400,
            color: AppColors.white70,
          ),
        ),
      ],
    );
  }
}
