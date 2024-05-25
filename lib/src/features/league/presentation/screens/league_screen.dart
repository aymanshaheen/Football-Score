import 'package:Goal/src/core/domain/entities/league.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/league/presentation/cubit/league_cubit/league_cubit.dart';
import 'package:Goal/src/features/league/presentation/cubit/league_cubit/league_state.dart';
import 'package:Goal/src/features/league/presentation/screens/matches_tab.dart';
import 'package:Goal/src/features/league/presentation/screens/player_stats_tab.dart';
import 'package:Goal/src/features/league/presentation/widgets/league_service.dart';
import 'package:Goal/src/features/soccer/domain/entities/standings.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/screens/standings_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_state.dart';

class LeagueInfoScreen extends StatefulWidget {
  final League league;
  const LeagueInfoScreen({
    super.key,
    required this.league,
  });

  @override
  State<LeagueInfoScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<LeagueInfoScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  LeagueService? leagueService;
  Standings? standings;

  @override
  void initState() {
    super.initState();
    leagueService = LeagueService(
        leagueInfoCubit: context.read<LeagueInfoCubit>(),
        teamCubit: context.read<TeamCubit>());
    controller = TabController(
      length: (widget.league.type == 'League') ? 3 : 2,
      vsync: this,
    );

    getList();
  }

  void getList() async {
    await leagueService!.getLists(league: widget.league);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamCubit, TeamStates>(listener: (context, state) {
      if (state is SoccerStandingsLoaded) {
        standings = state.standings;
      }
    }, builder: (context, state) {
      return BlocConsumer<LeagueInfoCubit, LeagueInfoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is TeamStatisticsLoading
              ? const CupertinoActivityIndicator()
              : Scaffold(
                  appBar: AppBar(
                      actionsIconTheme:
                          const IconThemeData(color: AppColors.white),
                      centerTitle: true,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notification_add_outlined),
                        ),
                        Container(
                          width: R.sW(context, 85),
                          margin: EdgeInsets.only(
                              right: R.sW(context, 13),
                              bottom: R.sH(context, 17),
                              top: R.sH(context, 17)),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("Follow",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: R.F(context, 13))),
                          ),
                        )
                      ],
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(R.sH(context, 100)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: R.sW(context, 20)),
                              child: Row(children: [
                                SizedBox(
                                  width: R.sW(context, 90),
                                  height: R.sH(context, 50),
                                  child: Center(
                                    child: Image(
                                        image: NetworkImage(
                                      widget.league.logo,
                                    )),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.league.name,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: R.F(context, 20),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                            Row(
                              children: [
                                TabBar(
                                  controller: controller,
                                  dividerColor: AppColors.darkgrey,
                                  physics: const BouncingScrollPhysics(),
                                  tabAlignment: TabAlignment.start,
                                  indicator: UnderlineTabIndicator(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: R.sW(context, 3),
                                        color: AppColors.green,
                                      ),
                                      insets: EdgeInsets.symmetric(
                                          horizontal: R.sH(context, -5))),
                                  labelColor: AppColors.white,
                                  unselectedLabelColor: AppColors.white70,
                                  isScrollable: true,
                                  indicatorWeight: R.sW(context, 3),
                                  tabs: [
                                    if (widget.league.type == 'League')
                                      const Tab(text: "Table"),
                                    const Tab(text: "Matches"),
                                    const Tab(text: "Player Stats"),
                                  ],
                                ),
                                Expanded(child: Container()),
                              ],
                            )
                          ],
                        ),
                      )),
                  body: TabBarView(
                    controller: controller,
                    children: <Widget>[
                      if (widget.league.type == 'League')
                        StandingsScreen(
                          standings: standings,
                        ),
                      LeagueMatchesTab(
                        leagueMatches: leagueService!.leagueMatches,
                      ),
                      PlayerStats(
                        topAsists: leagueService!.topAsists,
                        topGoals: leagueService!.topGoals,
                        topRedCards: leagueService!.topRedCards,
                        topYellowCards: leagueService!.topYellowCards,
                      ),
                    ],
                  ),
                );
        },
      );
    });
  }
}
