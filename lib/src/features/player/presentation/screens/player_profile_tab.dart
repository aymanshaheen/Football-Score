import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_cubit.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_state.dart';
import 'package:Goal/src/features/player/presentation/widgets/build_profile_state.dart';
import 'package:Goal/src/features/player/presentation/widgets/league_profile.dart';
import 'package:Goal/src/features/player/presentation/widgets/player_profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerOverViewTab extends StatelessWidget {
  final PlayerStatsInfo? playerStatsInfo;

  const PlayerOverViewTab({
    super.key,
    required this.playerStatsInfo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: R.sW(context, 15), vertical: R.sH(context, 15)),
          child: Column(children: [
            Container(
              height: R.sH(context, 260),
              decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(R.sW(context, 10)),
              ),
              child: Column(children: [
                PlayerInfoCard(playerStatsInfo: playerStatsInfo),
                const Divider(
                  color: Color.fromARGB(179, 101, 101, 101),
                ),
                SizedBox(
                  height: R.sH(context, 10),
                ),
                LeagueInfo(playerStatsInfo: playerStatsInfo),
                SizedBox(
                  height: R.sH(context, 20),
                ),
                PlayerProfileStats(playerStatsInfo: playerStatsInfo),
              ]),
            ),
          ]),
        );
      },
    );
  }
}
