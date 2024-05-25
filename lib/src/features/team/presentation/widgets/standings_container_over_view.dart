import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/domain/entities/standings.dart';
import 'package:Goal/src/features/soccer/domain/entities/team_rank.dart';
import 'package:Goal/src/features/team/presentation/widgets/standings_item.dart';
import 'package:flutter/material.dart';

class StandingsContainer extends StatelessWidget {
  final SoccerFixture match;
  final Standings? standings;
  final Team team;

  const StandingsContainer({
    super.key,
    required this.match,
    required this.standings,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: R.sH(context, 7),
      ),
      height: R.sH(context, 223),
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(R.sR(context, 10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: R.sH(context, 3)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: R.sH(context, 30),
                  width: R.sW(context, 30),
                  child: Center(
                    child: Image(
  image: NetworkImage(
                      match.fixtureLeague.logo,),
                      height: R.sH(context, 30),
                      width: R.sW(context, 30),
                    ),
                  ),
                ),
                SizedBox(width: R.sW(context, 10)),
                Padding(
                  padding: EdgeInsets.only(top: R.sH(context, 10)),
                  child: Text(
                    match.fixtureLeague.name,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: R.F(context, 13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (standings != null)
            ...List.generate(standings!.standings.length, (index) {
              List<TeamRank> teamRanks = standings!.standings[index];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StandingsHeaders(),
                    SizedBox(height: R.sH(context, 2)),
                    ...List.generate(teamRanks.length, (teamIndex) {
                      TeamRank teamItem = teamRanks[teamIndex];
                      if (teamItem.team == team) {
                        TeamRank? teamAbove = teamIndex > 0
                            ? teamRanks[teamIndex - 1]
                            : teamRanks[teamIndex + 2];
                        TeamRank? teamUnder = teamIndex < teamRanks.length - 1
                            ? teamRanks[teamIndex + 1]
                            : teamRanks[teamIndex - 2];
                        return Column(
                          children: [
                            if (teamIndex == 0) ...[
                              StandingsItem(teamRank: teamItem, team: team),
                              StandingsItem(teamRank: teamUnder, team: team),
                              StandingsItem(teamRank: teamAbove, team: team),
                            ] else if (teamIndex == teamRanks.length - 1) ...[
                              StandingsItem(teamRank: teamUnder, team: team),
                              StandingsItem(teamRank: teamAbove, team: team),
                              StandingsItem(teamRank: teamItem, team: team),
                            ] else ...[
                              StandingsItem(teamRank: teamAbove, team: team),
                              StandingsItem(teamRank: teamItem, team: team),
                              StandingsItem(teamRank: teamUnder, team: team),
                            ]
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    SizedBox(height: R.sH(context, 15)),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}
