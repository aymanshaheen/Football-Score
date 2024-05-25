import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_cubit.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_state.dart';
import 'package:Goal/src/features/player/presentation/widgets/player_state_info_card.dart';
import 'package:Goal/src/features/player/presentation/widgets/state_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerStatsTab extends StatelessWidget {
  final PlayerStatsInfo? playerStatsInfo;

  const PlayerStatsTab({
    super.key,
    required this.playerStatsInfo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: R.sW(context, 15), vertical: R.sH(context, 15)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: R.sH(context, 130),
                decoration: BoxDecoration(
                  color: AppColors.darkgrey,
                  borderRadius: BorderRadius.circular(R.sW(context, 10)),
                ),
                child: Column(children: [
                  PlayerStatesInfoCard(playerStatsInfo: playerStatsInfo),
                ]),
              ),
              SizedBox(height: R.sH(context, 15)),
              Container(
                padding: EdgeInsets.all(R.sW(context, 10)),
                decoration: BoxDecoration(
                  color: AppColors.darkgrey,
                  borderRadius: BorderRadius.circular(R.sW(context, 10)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Season Performance",
                        style: TextStyle(
                          fontSize: R.sW(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: R.sH(context, 10),
                      ),
                      const Divider(
                        color: AppColors.white70,
                      ),
                      SizedBox(
                        height: R.sH(context, 10),
                      ),
                      Text(
                        "Shooting",
                        style: TextStyle(
                          fontSize: R.sW(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: R.sH(context, 5),
                      ),
                      StatRow(
                        label: "Goals",
                        value: playerStatsInfo?.statisticsInfo[0].goals.total
                            .toString(),
                      ),
                      StatRow(
                        label: "Shots",
                        value: playerStatsInfo?.statisticsInfo[0].shots.total
                            .toString(),
                      ),
                      StatRow(
                        label: "Shots on target",
                        value: playerStatsInfo?.statisticsInfo[0].shots.on
                            .toString(),
                      ),
                      StatRow(
                        label: "Penalty goals",
                        value: playerStatsInfo?.statisticsInfo[0].penalty.scored
                            .toString(),
                      ),
                      Divider(
                        color: AppColors.white70,
                        indent: R.sW(context, 60),
                        endIndent: R.sW(context, 60),
                      ),
                      SizedBox(
                        height: R.sH(context, 10),
                      ),
                      Text(
                        "Passing",
                        style: TextStyle(
                          fontSize: R.sW(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: R.sH(context, 5),
                      ),
                      StatRow(
                        label: "Assists",
                        value: playerStatsInfo?.statisticsInfo[0].goals.assists
                            .toString(),
                      ),
                      StatRow(
                        label: "Successful passes",
                        value: playerStatsInfo?.statisticsInfo[0].passes.total
                            .toString(),
                      ),
                      StatRow(
                        label: "Pass accuracy",
                        value: playerStatsInfo
                            ?.statisticsInfo[0].passes.accuracy
                            .toString(),
                      ),
                      StatRow(
                        label: "Chances created",
                        value: playerStatsInfo?.statisticsInfo[0].passes.key
                            .toString(),
                      ),
                      Divider(
                        color: AppColors.white70,
                        indent: R.sW(context, 60),
                        endIndent: R.sW(context, 60),
                      ),
                      SizedBox(
                        height: R.sH(context, 10),
                      ),
                      Text(
                        "Possession",
                        style: TextStyle(
                          fontSize: R.sW(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: R.sH(context, 5),
                      ),
                      StatRow(
                        label: "Successful dribbles",
                        value: playerStatsInfo
                            ?.statisticsInfo[0].dribbles.success
                            .toString(),
                      ),
                      StatRow(
                        label: "Dribbles attempted",
                        value: playerStatsInfo
                            ?.statisticsInfo[0].dribbles.attempts
                            .toString(),
                      ),
                      StatRow(
                        label: "Fouls won",
                        value: playerStatsInfo?.statisticsInfo[0].fouls.drawn
                            .toString(),
                      ),
                      StatRow(
                        label: "penalties awarded",
                        value: playerStatsInfo?.statisticsInfo[0].penalty.won
                            .toString(),
                      ),
                      Divider(
                        color: AppColors.white70,
                        indent: R.sW(context, 60),
                        endIndent: R.sW(context, 60),
                      ),
                      SizedBox(
                        height: R.sH(context, 10),
                      ),
                      Text(
                        "Defending",
                        style: TextStyle(
                          fontSize: R.sW(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: R.sH(context, 5),
                      ),
                      StatRow(
                        label: "Tackles won",
                        value: playerStatsInfo?.statisticsInfo[0].tackles.total
                            .toString(),
                      ),
                      StatRow(
                        label: "Duels won",
                        value: playerStatsInfo?.statisticsInfo[0].duels.won
                            .toString(),
                      ),
                      StatRow(
                        label: "Interceptions",
                        value: playerStatsInfo
                            ?.statisticsInfo[0].tackles.interceptions
                            .toString(),
                      ),
                      StatRow(
                        label: "Blocked",
                        value: playerStatsInfo?.statisticsInfo[0].tackles.blocks
                            .toString(),
                      ),
                      Divider(
                        color: AppColors.white70,
                        indent: R.sW(context, 60),
                        endIndent: R.sW(context, 60),
                      ),
                      Text(
                        "Discipline",
                        style: TextStyle(
                          fontSize: R.sW(context, 14),
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: R.sH(context, 5),
                      ),
                      StatRow(
                        label: "Red cards",
                        value: playerStatsInfo?.statisticsInfo[0].cards.red
                            .toString(),
                      ),
                      StatRow(
                        label: "Yellow cards",
                        value: playerStatsInfo?.statisticsInfo[0].cards.yellow
                            .toString(),
                      ),
                      SizedBox(
                        height: R.sH(context, 10),
                      ),
                    ]),
              ),
            ]),
          ),
        );
      },
    );
  }
}
