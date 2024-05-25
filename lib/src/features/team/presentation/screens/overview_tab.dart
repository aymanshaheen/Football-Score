import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/domain/entities/standings.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_state.dart';
import 'package:Goal/src/features/team/presentation/widgets/last_5matches_container.dart';
import 'package:Goal/src/features/team/presentation/widgets/next_match_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OverViewTab extends StatefulWidget {
  final SoccerFixture match;
  final Standings? standings;
  final TeamStatistics? teamStatistics;
  List<SoccerFixture> lastMatches = [];
  final Team team;
  OverViewTab(
      {super.key,
      required this.team,
      required this.match,
      required this.lastMatches,
      required this.teamStatistics,
      required this.standings});

  @override
  State<OverViewTab> createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
  final List<SoccerFixture> nextMatch = [];

  String fixtureTime = '';

  @override
  Widget build(BuildContext context) {
    fixtureTime = widget.match.fixture.date;
    final localTime = DateTime.parse(fixtureTime).toLocal();
    final formattedTime = DateFormat("h:mm a").format(localTime);
    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(R.sW(context, 10)),
            child: Column(
              children: [
                widget.teamStatistics == null
                    ? Container()
                    : NextMatchContainer(
                        match: widget.match, formattedTime: formattedTime),
                SizedBox(height: R.sH(context, 10)),
                widget.teamStatistics!.form == null ||
                        widget.lastMatches.isEmpty
                    ? Container()
                    : LastFiveMatchesContainer(
                        teamStatistics: widget.teamStatistics,
                        lastMatches: widget.lastMatches,
                        team: widget.team),
                SizedBox(height: R.sH(context, 10)),
              ],
            ),
          ),
        );
      },
    );
  }
}
