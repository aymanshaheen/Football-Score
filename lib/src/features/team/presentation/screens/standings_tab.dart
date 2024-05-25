import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../soccer/domain/entities/standings.dart';
import '../../../soccer/domain/entities/team_rank.dart';
import '../widgets/standings_item.dart';

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({super.key, required this.standings, this.team});
  final Standings? standings;
  final Team? team;

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamCubit, TeamStates>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: R.sW(context, 10)),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(R.sR(context, 10)),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: R.sH(context, 10)),
              if (state is SoccerStandingsLoading)
                const Center(
                    child: LinearProgressIndicator(color: AppColors.green)),
              if (widget.standings != null)
                ...List.generate(
                  widget.standings!.standings.length,
                  (index) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const StandingsHeaders(),
                        SizedBox(height: R.sH(context, 2)),
                        ...List.generate(
                            widget.standings!.standings[index].length,
                            (teamIndex) {
                          TeamRank teamItem =
                              widget.standings!.standings[index][teamIndex];
                          return StandingsItem(
                            teamRank: teamItem,
                            team: widget.team,
                          );
                        }),
                        SizedBox(height: R.sH(context, 15)),
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
      listener: (BuildContext context, TeamStates state) {},
    );
  }
}
