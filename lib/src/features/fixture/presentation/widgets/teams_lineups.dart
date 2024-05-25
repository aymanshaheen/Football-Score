import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/domain/entities/player_statistics.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/rating.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/statistics_row.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../domain/entities/lineups.dart';

class TeamsLineups extends StatefulWidget {
  final List<Lineup> lineups;

  const TeamsLineups({super.key, required this.lineups});

  @override
  State<TeamsLineups> createState() => _TeamsLineupsState();
}

class _TeamsLineupsState extends State<TeamsLineups> {
  @override
  Widget build(BuildContext context) {
    OverlayEntry? overlayEntry;

    List<String> teamOnePlan = widget.lineups[0].formation.split("-");
    Iterable<String> teamTwoPlan =
        widget.lineups[1].formation.split("-").reversed;
    List<PlayerSquad> teamOnePlayers = widget.lineups[0].startXI;
    Iterable<PlayerSquad> teamTwoPlayers = widget.lineups[1].startXI.reversed;

    int lineOneNumber = 0;
    int lineTwoNumber = -1;
    void showOverlay(BuildContext context, String photo, String name,
        PlayerStatistics playerStatistics, PlayerSquad player) {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => overlayEntry?.remove(),
            ),
            Center(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.darkgrey,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: R.sW(context, 10),
                      vertical: R.sH(context, 10),
                    ),
                    margin: EdgeInsets.only(top: R.sH(context, 100)),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: AppSize.s25,
                              backgroundImage: NetworkImage(photo),
                            ),
                          ),
                          Center(
                            child: Text(
                              name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          SizedBox(height: R.sH(context, 10)),
                          const Text(
                            "Top Stats",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: R.sH(context, 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Rating",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              PlayerRating(
                                  playerStatistics:
                                      playerStatistics.games.rating)
                            ],
                          ),
                          StatisticRow(
                              title: "Minutes Played",
                              value: playerStatistics.games.minutes.toString()),
                          StatisticRow(
                              title: "Goals",
                              value: playerStatistics.goals.total.toString()),
                          StatisticRow(
                              title: "Asists",
                              value: playerStatistics.goals.assists.toString()),
                          StatisticRow(
                              title: "Saves",
                              value: playerStatistics.goals.saves.toString()),
                          StatisticRow(
                              title: "Accurate Passes",
                              value:
                                  playerStatistics.passes.accuracy.toString()),
                          StatisticRow(
                              title: "Total Shots",
                              value: playerStatistics.shots.total.toString()),
                          SizedBox(height: R.sH(context, 10)),
                          const Text(
                            "Attack",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          StatisticRow(
                              title: "Touches",
                              value: playerStatistics.passes.total.toString()),
                          StatisticRow(
                              title: "Shots on Goal",
                              value: playerStatistics.shots.on.toString()),
                          StatisticRow(
                              title: "Key Passes",
                              value: playerStatistics.passes.key.toString()),
                          StatisticRow(
                              title: "Dribbles Attempted",
                              value: playerStatistics.dribbles.attempts
                                  .toString()),
                          StatisticRow(
                              title: "Dribbles Success",
                              value:
                                  playerStatistics.dribbles.success.toString()),
                          SizedBox(height: R.sH(context, 10)),
                          const Text(
                            "Defence",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          StatisticRow(
                              title: "Blocks",
                              value:
                                  playerStatistics.tackles.blocks.toString()),
                          StatisticRow(
                              title: "Interceptions",
                              value: playerStatistics.tackles.interceptions
                                  .toString()),
                          StatisticRow(
                              title: "Duels won",
                              value: playerStatistics.duels.won.toString()),
                          StatisticRow(
                              title: "Fouls Committed",
                              value:
                                  playerStatistics.fouls.committed.toString()),
                          StatisticRow(
                              title: "Was Fouled",
                              value: playerStatistics.fouls.drawn.toString()),
                          SizedBox(height: R.sH(context, 10)),
                          GestureDetector(
                            onTap: () {
                              overlayEntry?.remove();
                              Navigator.of(context).pushNamed(
                                Routes.player,
                                arguments: player.id.toString(),
                              );
                            },
                            child: const Center(
                              child: Text(
                                "View Profile",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: R.sH(context, 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(overlayEntry!);
    }

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => showOverlay(
                    context,
                    FixtureCubit.get(context)
                        .playerPhotos[teamOnePlayers[0].id]!,
                    teamOnePlayers[0].name,
                    FixtureCubit.get(context)
                        .playerStatistics[teamOnePlayers[0].id]!,
                    teamOnePlayers[0]),
                child: Column(
                  children: [
                    Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(right: R.sW(context, 15)),
                        child: CircleAvatar(
                          radius: AppSize.s25,
                          backgroundImage: NetworkImage(
                              FixtureCubit.get(context).playerPhotos[
                                      teamOnePlayers[lineOneNumber].id] ??
                                  ''),
                        ),
                      ),
                      PlayerRating(
                        playerStatistics: FixtureCubit.get(context)
                            .playerStatistics[teamOnePlayers[0].id]!
                            .games
                            .rating,
                      )
                    ]),
                    SizedBox(
                      height: R.sH(context, 5),
                    ),
                    Text(
                      "${teamOnePlayers[0].number} ${teamOnePlayers[0].name}",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSize.s10),
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      int.parse(teamOnePlan[index]),
                      (_) {
                        lineOneNumber++;
                        List<String> playerName =
                            teamOnePlayers[lineOneNumber].name.split(" ");
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => showOverlay(
                                context,
                                FixtureCubit.get(context).playerPhotos[
                                    teamOnePlayers[lineOneNumber].id]!,
                                teamOnePlayers[lineOneNumber].name,
                                FixtureCubit.get(context).playerStatistics[
                                    teamOnePlayers[lineOneNumber].id]!,
                                teamOnePlayers[lineOneNumber]),
                            child: Column(
                              children: [
                                Stack(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: R.sW(context, 15)),
                                    child: CircleAvatar(
                                      radius: AppSize.s25,
                                      backgroundImage: NetworkImage(
                                          FixtureCubit.get(context)
                                                      .playerPhotos[
                                                  teamOnePlayers[lineOneNumber]
                                                      .id] ??
                                              ''),
                                    ),
                                  ),
                                  PlayerRating(
                                    playerStatistics: FixtureCubit.get(context)
                                        .playerStatistics[
                                            teamOnePlayers[lineOneNumber].id]!
                                        .games
                                        .rating,
                                  )
                                ]),
                                SizedBox(height: R.sH(context, 5)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      teamOnePlayers[lineOneNumber]
                                          .number
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: AppColors.white),
                                    ),
                                    SizedBox(width: R.sH(context, 5)),
                                    SizedBox(
                                      width: R.sW(context, 66),
                                      child: Text(
                                        playerName.length >= 3
                                            ? playerName[1] + playerName[2]
                                            : playerName.length == 2
                                                ? playerName[1]
                                                : playerName[0],
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: AppColors.white,
                                                fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                itemCount: teamOnePlan.length,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSize.s10),
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      int.parse(teamTwoPlan.elementAt(index)),
                      (_) {
                        lineTwoNumber++;
                        List<String> playerName = teamTwoPlayers
                            .elementAt(lineTwoNumber)
                            .name
                            .split(" ");
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => showOverlay(
                                context,
                                FixtureCubit.get(context).playerPhotos[
                                    teamTwoPlayers
                                        .elementAt(lineTwoNumber)
                                        .id]!,
                                teamTwoPlayers.elementAt(lineTwoNumber).name,
                                FixtureCubit.get(context).playerStatistics[
                                    teamTwoPlayers
                                        .elementAt(lineTwoNumber)
                                        .id]!,
                                teamTwoPlayers.elementAt(lineTwoNumber)),
                            child: Column(
                              children: [
                                Stack(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: R.sW(context, 15)),
                                    child: CircleAvatar(
                                      radius: AppSize.s25,
                                      backgroundImage: NetworkImage(
                                          FixtureCubit.get(context)
                                                      .playerPhotos[
                                                  teamTwoPlayers
                                                      .elementAt(lineTwoNumber)
                                                      .id] ??
                                              ''),
                                    ),
                                  ),
                                  PlayerRating(
                                    playerStatistics: FixtureCubit.get(context)
                                        .playerStatistics[teamTwoPlayers
                                            .elementAt(lineTwoNumber)
                                            .id]!
                                        .games
                                        .rating,
                                  )
                                ]),
                                const SizedBox(height: AppSize.s2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      teamTwoPlayers
                                          .elementAt(lineTwoNumber)
                                          .number
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: AppColors.white),
                                    ),
                                    const SizedBox(width: AppSize.s5),
                                    SizedBox(
                                      width: R.sW(context, 66),
                                      child: Text(
                                        playerName.length >= 3
                                            ? playerName[1] + playerName[2]
                                            : playerName.length == 2
                                                ? playerName[1]
                                                : playerName[0],
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: AppColors.white,
                                                fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                itemCount: teamTwoPlan.length,
              ),
              GestureDetector(
                onTap: () => showOverlay(
                    context,
                    FixtureCubit.get(context)
                        .playerPhotos[teamTwoPlayers.elementAt(10).id]!,
                    teamTwoPlayers.elementAt(10).name,
                    FixtureCubit.get(context)
                        .playerStatistics[teamTwoPlayers.elementAt(10).id]!,
                    teamTwoPlayers.elementAt(10)),
                child: Column(
                  children: [
                    Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(right: R.sW(context, 15)),
                        child: CircleAvatar(
                          radius: AppSize.s25,
                          backgroundImage: NetworkImage(
                              FixtureCubit.get(context).playerPhotos[
                                      teamTwoPlayers.elementAt(10).id] ??
                                  ''),
                        ),
                      ),
                      PlayerRating(
                        playerStatistics: FixtureCubit.get(context)
                            .playerStatistics[teamTwoPlayers.elementAt(10).id]!
                            .games
                            .rating,
                      )
                    ]),
                    SizedBox(
                      height: R.sH(context, 5),
                    ),
                    Text(
                      "${teamTwoPlayers.elementAt(10).number} ${teamTwoPlayers.elementAt(10).name}",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
