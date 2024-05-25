import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/domain/entities/standings.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:Goal/src/features/team/presentation/screens/matches_tab.dart';
import 'package:Goal/src/features/team/presentation/screens/overview_tab.dart';
import 'package:Goal/src/features/team/presentation/screens/squad_tab.dart';
import 'package:Goal/src/features/team/presentation/widgets/team_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/features/team/presentation/screens/standings_tab.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_state.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({
    super.key,
    required this.soccerFixture,
    required this.team,
  });
  final SoccerFixture soccerFixture;
  final Team team;

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  TeamStatistics? teamStatistics;
  TeamSquad? playerSquad;
  Standings? standings;
  TeamService? teamService;
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    teamService = TeamService(teamCubit: context.read<TeamCubit>());
    controller = TabController(
      length: 4,
      vsync: this,
    );
    getList();
  }

  void getList() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(AppConstants.token)
        .collection('favorites')
        .doc('teams')
        .collection('items')
        .doc(widget.team.id.toString())
        .get();

    isFavourite = snapshot.exists;
    await teamService!
        .getLists(team: widget.team, soccerFixture: widget.soccerFixture);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {
        if (state is TeamStatisticsLoaded) {
          teamStatistics = state.teamStatistics;
        }
        if (state is SoccerStandingsLoaded) {
          standings = state.standings;
        }
        if (state is PlayerSquadLoaded) {
          playerSquad = state.teamSquad;
        }
      },
      builder: (context, state) {
        return teamStatistics == null
            ? const Scaffold(body: CupertinoActivityIndicator())
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
                      BlocBuilder<TeamCubit, TeamStates>(
                        builder: (context, state) {
                          if (state is AddFavouriteLoaded) {
                            isFavourite = true;
                          } else if (state is DeleteFavouriteLoaded) {
                            isFavourite = false;
                          }
                          return InkWell(
                            onTap: () {
                              if (isFavourite) {
                                TeamCubit.get(context).deleteFavourite(
                                    id: widget.team.id.toString());
                              } else {
                                TeamCubit.get(context).addFavourite(
                                  id: widget.team.id.toString(),
                                  photo: widget.team.logo,
                                  name: widget.team.name,
                                );
                              }
                            },
                            child: Container(
                              width: R.sW(context, 85),
                              margin: EdgeInsets.only(
                                  right: R.sW(context, 13),
                                  bottom: R.sH(context, 12),
                                  top: R.sH(context, 12)),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                                color: !isFavourite
                                    ? AppColors.darkgrey
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                    isFavourite ? "Following" : "Follow",
                                    style: TextStyle(
                                        color: isFavourite
                                            ? AppColors.darkgrey
                                            : AppColors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: R.F(context, 13))),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(R.sH(context, 100)),
                      child: teamStatistics != null
                          ? Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: R.sW(context, 20)),
                                  child: Row(children: [
                                    SizedBox(
                                      width: R.sW(context, 90),
                                      height: R.sH(context, 50),
                                      child: Center(
                                        child: Image(
                                            image: NetworkImage(
                                          teamStatistics!.team!.logo,
                                        )),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          teamStatistics!.team!.name,
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: R.F(context, 20),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: R.sH(context, 5),
                                        ),
                                        Text(
                                            teamStatistics!.league!.name
                                                .toString(),
                                            style: const TextStyle(
                                                color: AppColors.white70)),
                                      ],
                                    )
                                  ]),
                                ),
                                Row(
                                  children: [
                                    TabBar(
                                      controller: controller,
                                      tabAlignment: TabAlignment.start,
                                      labelPadding: EdgeInsets.symmetric(
                                        horizontal: R.sW(context, 10),
                                      ),
                                      physics: const BouncingScrollPhysics(),
                                      dividerColor: Colors.transparent,
                                      indicator: UnderlineTabIndicator(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  R.sR(context, 10)),
                                              topRight: Radius.circular(
                                                  R.sR(context, 10))),
                                          borderSide: BorderSide(
                                            color: AppColors.green,
                                            width: R.sW(context, 3),
                                          ),
                                          insets: EdgeInsets.symmetric(
                                              horizontal: R.sH(context, 2))),
                                      labelColor: AppColors.white,
                                      unselectedLabelColor: AppColors.white70,
                                      isScrollable: true,
                                      indicatorWeight: R.sW(context, 3),
                                      tabs: const [
                                        Tab(text: "Overview"),
                                        Tab(text: "Table"),
                                        Tab(text: "Matches"),
                                        Tab(text: "Squad"),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                )
                              ],
                            )
                          : Container(),
                    )),
                body: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    TeamCubit.get(context).nextMatches.isNotEmpty
                        ? OverViewTab(
                            standings: standings,
                            match: widget.soccerFixture,
                            team: widget.team,
                            lastMatches: TeamCubit.get(context).lastMatches,
                            teamStatistics: teamStatistics!,
                          )
                        : Container(),
                    standings != null
                        ? StandingsScreen(
                            standings: standings,
                            team: widget.team,
                          )
                        : Container(),
                    TeamCubit.get(context).lastMatches.isNotEmpty &&
                            TeamCubit.get(context).nextMatches.isNotEmpty
                        ? MatchesTab(
                            nextMatches: TeamCubit.get(context).nextMatches,
                            lastMatches: TeamCubit.get(context).lastMatches,
                          )
                        : Container(),
                    playerSquad != null
                        ? PlayerSquadTab(teamSquad: playerSquad!)
                        : Container(),
                  ],
                ),
              );
      },
    );
  }
}
