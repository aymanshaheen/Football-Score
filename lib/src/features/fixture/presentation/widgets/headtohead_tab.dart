import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/widgets/circular_indicator.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/chart.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/items_not_available.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/fixture_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HeadToHead extends StatefulWidget {
  final SoccerFixture match;

  const HeadToHead({
    super.key,
    required this.match,
  });

  @override
  State<HeadToHead> createState() => _HeadToHeadState();
}

class _HeadToHeadState extends State<HeadToHead> {
  @override
  void initState() {
    super.initState();
    FixtureCubit.get(context).getH2H(widget.match.fixture.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    double parsePercentage(String percentageString) {
      String cleanedString = percentageString.replaceAll("%", "");
      double percentage = double.parse(cleanedString);
      return percentage;
    }

    return BlocConsumer<FixtureCubit, FixtureState>(
        listener: (context, state) {},
        builder: (context, state) {
          FixtureCubit cubit = FixtureCubit.get(context);
          if (state is FixtureH2HLoading) {
            return const Center(
              child: CircularIndicator(),
            );
          } else if (FixtureCubit.get(context).h2hFixtures.isEmpty) {
            return const ItemsNotAvailable(
              message: AppStrings.noEvents,
              icon: Icons.event_busy,
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: R.sH(context, 10)),
                Container(
                  height: R.sH(context, 280),
                  width: R.sW(context, 350),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkgrey,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: R.sW(context, 10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: R.sW(context, 5),
                    vertical: R.sH(context, 10),
                  ),
                  child: RadarChart(
                    numAxes: 5,
                    dataValues1: [
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .form
                          .home),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .att
                          .home),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .def
                          .home),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .head2head
                          .home),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .poissonDistribution
                          .home),
                    ],
                    dataValues2: [
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .form
                          .away),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .att
                          .away),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .def
                          .away),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .head2head
                          .away),
                      parsePercentage(FixtureCubit.get(context)
                          .h2hFixtures
                          .first
                          .comparison
                          .poissonDistribution
                          .away),
                    ],
                    maxValue: 100,
                    axisColor: const Color.fromARGB(255, 79, 78, 78),
                    dataColor1: HexColor(
                        "#${FixtureCubit.get(context).lineups[0].team.colors.player.primary}"),
                    dataColor2: HexColor(
                        "#${FixtureCubit.get(context).lineups[1].team.colors.player.primary}"),
                    axisLabels: const [
                      'Form',
                      'Attack',
                      'Defence',
                      'H2H',
                      'Possession',
                    ],
                  ),
                ),
                SizedBox(height: R.sH(context, 10)),
                Container(
                    width: R.sW(context, 350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.darkgrey,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: R.sW(context, 10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: R.sW(context, 10),
                      vertical: R.sH(context, 10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Previous Matches",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: R.sH(context, 20)),
                        ...List.generate(cubit.h2hFixtures.first.h2h.length,
                            (index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      Routes.fixture,
                                      arguments:
                                          cubit.h2hFixtures.first.h2h[index]);
                                },
                                child: FixtureCard(
                                  soccerFixture:
                                      cubit.h2hFixtures.first.h2h[index],
                                  isShowNextMatch: false,
                                ),
                              ),
                              SizedBox(height: R.sH(context, 5)),
                            ],
                          );
                        }),
                      ],
                    )),
                SizedBox(height: R.sH(context, 10)),
                Container(
                  width: R.sW(context, 350),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkgrey,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: R.sW(context, 10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: R.sW(context, 15),
                    vertical: R.sH(context, 10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: NetworkImage(
                              cubit.h2hFixtures.first.teamsComparison.home.logo,
                            ),
                            height: R.sH(context, 40),
                            width: R.sW(context, 40),
                          ),
                          Text(
                            "Season so far",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Image(
                            image: NetworkImage(
                              cubit.h2hFixtures.first.teamsComparison.away.logo,
                            ),
                            height: R.sH(context, 40),
                            width: R.sW(context, 40),
                          ),
                        ],
                      ),
                      SizedBox(height: R.sH(context, 10)),
                      const Divider(color: Color.fromARGB(179, 115, 111, 111)),
                      SizedBox(height: R.sH(context, 5)),
                      StateInfo(
                        state1: cubit.h2hFixtures.first.teamsComparison.home
                            .league.fixtures.wins.total,
                        state2: cubit.h2hFixtures.first.teamsComparison.away
                            .league.fixtures.wins.total,
                        data: "Won",
                      ),
                      StateInfo(
                        state1: cubit.h2hFixtures.first.teamsComparison.home
                            .league.fixtures.draws.total,
                        state2: cubit.h2hFixtures.first.teamsComparison.away
                            .league.fixtures.draws.total,
                        data: "Drawn",
                      ),
                      StateInfo(
                        state1: cubit.h2hFixtures.first.teamsComparison.home
                            .league.fixtures.loses.total,
                        state2: cubit.h2hFixtures.first.teamsComparison.away
                            .league.fixtures.loses.total,
                        data: "Lost",
                      ),
                      StateInfo(
                        state1: cubit.h2hFixtures.first.teamsComparison.home
                            .league.goals.forGoals.total.total,
                        state2: cubit.h2hFixtures.first.teamsComparison.away
                            .league.goals.forGoals.total.total,
                        data: "Goals",
                      ),
                      StateInfo(
                        state1: cubit.h2hFixtures.first.teamsComparison.home
                            .league.goals.against.total.total,
                        state2: cubit.h2hFixtures.first.teamsComparison.away
                            .league.goals.against.total.total,
                        data: "Goals Conceded",
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class StateInfo extends StatelessWidget {
  final num state1;
  final num state2;
  final String data;
  const StateInfo({
    super.key,
    required this.state1,
    required this.state2,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: R.sH(context, 5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: R.sW(context, 40),
              padding: EdgeInsets.symmetric(
                  horizontal: R.sW(context, 10), vertical: R.sH(context, 5)),
              decoration: BoxDecoration(
                color: state1 > state2
                    ? HexColor(
                        "#${FixtureCubit.get(context).lineups[0].team.colors.player.primary}")
                    : null,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  state1.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: R.F(context, 14)),
                ),
              ),
            ),
            Text(
              data,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: R.F(context, 14)),
            ),
            Container(
              width: R.sW(context, 40),
              padding: EdgeInsets.symmetric(
                  horizontal: R.sW(context, 10), vertical: R.sH(context, 5)),
              decoration: BoxDecoration(
                color: state1 < state2
                    ? HexColor(
                        "#${FixtureCubit.get(context).lineups[1].team.colors.player.primary}")
                    : null,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  state2.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: R.F(context, 14),
                      color:
                          state1 < state2 ? AppColors.black : AppColors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
