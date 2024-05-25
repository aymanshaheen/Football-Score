import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/events_view.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/fixture_details.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/headtohead_tab.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/lineups_view.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/preview-tab.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/statistics_view.dart';
import 'package:Goal/src/features/soccer/domain/use_cases/standings_usecase.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/screens/standings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/core/utils/app_colors.dart';

class MatchScreen extends StatefulWidget {
  final SoccerFixture soccerFixture;

  const MatchScreen({
    super.key,
    required this.soccerFixture,
  });

  @override
  State<MatchScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<MatchScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  FixtureCubit? cubit;
  TeamCubit? teamCubit;
  bool hasLoadedLineups = false;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: tabs.length,
      vsync: this,
    );
    cubit = context.read<FixtureCubit>();
    teamCubit = context.read<TeamCubit>();
    getList();
  }

  getList() async {
     await cubit!.getEvents(widget.soccerFixture.fixture.id.toString());
    await cubit!
        .getStatistics(widget.soccerFixture.fixture.id.toString())
        .then((value) {
      StandingsParams standingsParams = StandingsParams(
          leagueId: widget.soccerFixture.fixtureLeague.id.toString(),
          season: widget.soccerFixture.fixtureLeague.season.toString());
      Future.wait([
        cubit!.getLineups(widget.soccerFixture.fixture.id.toString()),
         teamCubit!.getStandings(standingsParams),
        cubit!.getplayersStatistics(widget.soccerFixture.fixture.id.toString())
      ]);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  List<Tab> tabs = const [
    Tab(text: "Facts"),
    Tab(text: "Ticker"),
    Tab(text: "Lineup"),
    Tab(text: "Table"),
    Tab(text: "Stats"),
    Tab(text: "H2H"),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FixtureCubit, FixtureState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              actionsIconTheme: const IconThemeData(color: AppColors.white),
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
                  icon: const Icon(Icons.notification_add_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.star_border_outlined),
                  onPressed: () {},
                )
              ],
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(R.sH(context, 130)),
                  child: Column(
                    children: [
                      FixtureDetails(soccerFixture: widget.soccerFixture),
                      TabBar(
                        dividerColor: AppColors.darkgrey,
                        physics: const BouncingScrollPhysics(),
                        tabAlignment: TabAlignment.start,
                        controller: controller,
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
                        tabs: tabs,
                      )
                    ],
                  ))),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              PreviewTab(match: widget.soccerFixture),
              EventsView(
                events: cubit!.events,
              ),
              LineupsView(lineups: cubit!.lineups),
              StandingsScreen(
                standings: teamCubit!.standing,
              ),
              StatisticsView(statistics: cubit!.statistics),
              HeadToHead(match: widget.soccerFixture),
            ],
          ),
        );
      },
    );
  }
}
