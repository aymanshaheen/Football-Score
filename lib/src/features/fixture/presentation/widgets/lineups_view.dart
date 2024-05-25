import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/widgets/circular_indicator.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/items_not_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/lineups.dart';
import 'teams_lineups.dart';

class LineupsView extends StatelessWidget {
  final List<Lineup> lineups;

  const LineupsView({super.key, required this.lineups});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixtureCubit, FixtureState>(builder: (context, state) {
      if (state is FixturePlayersStatisticsLoading) {
        return const Center(
          child: CircularIndicator(),
        );
      } else if (lineups.isEmpty) {
        return const ItemsNotAvailable(
          icon: Icons.people,
          message: AppStrings.noLineups,
        );
      }
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildTeamHeader(context: context, lineup: lineups[0]),
            Container(
              width: double.infinity,
              height: R.sH(context, 835),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppAssets.playground),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p15,
                  horizontal: AppPadding.p15,
                ),
                child: TeamsLineups(lineups: lineups),
              ),
            ),
            buildTeamHeader(context: context, lineup: lineups[1]),
            SizedBox(
              height: R.sH(context, 10),
            ),
            lineups[0].coachName == "" || lineups[1].coachName == ""
                ? const SizedBox.shrink()
                : Container(
                    padding: EdgeInsets.all(R.sW(context, 15)),
                    height: R.sH(context, 150),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: R.sW(context, 10),
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.darkgrey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Coach",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: R.sH(context, 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                    image: NetworkImage(
                                      lineups[0].coachPhoto,
                                    ),
                                    fit: BoxFit.cover,
                                    width: R.sH(context, 60),
                                    height: R.sH(context, 60),
                                  ),
                                ),
                                SizedBox(height: R.sH(context, 10)),
                                Text(
                                  lineups[0].coachName,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                    image: NetworkImage(
                                      lineups[1].coachPhoto,
                                    ),
                                    fit: BoxFit.cover,
                                    width: R.sH(context, 60),
                                    height: R.sH(context, 60),
                                  ),
                                ),
                                SizedBox(height: R.sH(context, 10)),
                                Text(
                                  lineups[1].coachName,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: R.sH(context, 10),
            ),
            Container(
              padding: EdgeInsets.all(R.sW(context, 15)),
              width: double.infinity,
              height: R.sH(context, 520),
              margin: EdgeInsets.symmetric(
                horizontal: R.sW(context, 10),
              ),
              decoration: const BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bench", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(
                    height: R.sH(context, 10),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lineups[0].substitutes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(lineups[0].substitutes[index].name,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: R.F(context, 12))),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: lineups[1].substitutes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(lineups[1].substitutes[index].name,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: R.F(context, 12))),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildTeamHeader(
      {required BuildContext context, required Lineup lineup}) {
    return Container(
      color: AppColors.darkgrey,
      padding: const EdgeInsetsDirectional.all(AppPadding.p5),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              lineup.team.logo,
            ),
            fit: BoxFit.cover,
            width: R.sH(context, 35),
            height: R.sH(context, 35),
          ),
          SizedBox(width: R.sW(context, 10)),
          Text(
            lineup.team.name,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Text(
            lineup.formation,
            style: const TextStyle(
                color: Colors.white, fontSize: FontSize.subTitle),
          ),
          SizedBox(width: R.sW(context, 10)),
        ],
      ),
    );
  }
}
