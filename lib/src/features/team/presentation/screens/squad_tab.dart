import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/circular_image.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerSquadTab extends StatefulWidget {
  final TeamSquad teamSquad;
  const PlayerSquadTab({
    super.key,
    required this.teamSquad,
  });

  @override
  State<PlayerSquadTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<PlayerSquadTab> {
  @override
  Widget build(BuildContext context) {
    final Map<String, List<PlayerSquad>> groupedPlayers = {};
    for (final player in widget.teamSquad.playerSquad) {
      if (!groupedPlayers.containsKey(player.position)) {
        groupedPlayers[player.position] = [];
      }
      groupedPlayers[player.position]!.add(player);
    }

    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(R.sW(context, 10)),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: groupedPlayers.keys.length,
                  itemBuilder: (context, index) {
                    final position = groupedPlayers.keys.elementAt(index);
                    final players = groupedPlayers[position]!;
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: R.sH(context, 5),
                          horizontal: R.sW(context, 5)),
                      padding: EdgeInsets.all(R.sW(context, 10)),
                      decoration: BoxDecoration(
                        color: AppColors.darkgrey,
                        borderRadius: BorderRadius.circular(R.sR(context, 10)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                position,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: R.F(context, 16),
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: R.sH(context, 10)),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: players.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(Routes.player,
                                      arguments: players[index].id.toString());
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(R.sW(context, 8.0)),
                                  child: Row(
                                    children: [
                                      CircularImageBuilder(
                                          photo: players[index].photo,
                                          height: 40,
                                          width: 40),
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
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
