import 'package:Goal/src/core/widgets/media_query.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/statistics.dart';

class StatisticsView extends StatelessWidget {
  final List<Statistics> statistics;

  const StatisticsView({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [2, 0, 1, 6, 7, 8, 10, 11, 13, 14, 15];
    return statistics.isNotEmpty
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: R.sH(context, 10)),
                Container(
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
                    child: Column(
                      children: [
                        Text(
                          AppStrings.topStats,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: R.F(context, 16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: R.sH(context, 10)),
                        if (FixtureCubit.get(context).lineups.isNotEmpty)
                          Container(
                            height: R.sH(context, 40),
                            decoration: BoxDecoration(
                              color: HexColor(
                                  "#${FixtureCubit.get(context).lineups[1].team.colors.player.primary}"),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 0.0,
                                    top: 0.0,
                                    child: Container(
                                      height: R.sH(context, 40),
                                      width: R.sW(
                                          context,
                                          350 *
                                              (double.parse(
                                                      FixtureCubit.get(context)
                                                          .statistics[0]
                                                          .statistics[9]
                                                          .value
                                                          .replaceAll(
                                                              "%", "")) /
                                                  100)),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50)),
                                        color: HexColor(
                                            "#${FixtureCubit.get(context).lineups[0].team.colors.player.primary}"),
                                      ),
                                    )),
                                Positioned(
                                  left: 10.0,
                                  top: 10.0,
                                  child: Text(
                                    FixtureCubit.get(context)
                                        .statistics[0]
                                        .statistics[9]
                                        .value,
                                    style: TextStyle(
                                      fontSize: R.F(context, 14),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10.0,
                                  top: 10.0,
                                  child: Text(
                                    FixtureCubit.get(context)
                                        .statistics[1]
                                        .statistics[9]
                                        .value,
                                    style: TextStyle(
                                      fontSize: R.F(context, 14),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        SizedBox(height: R.sH(context, 20)),
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => buildStatsRow(
                            context: context,
                            statisticHome:
                                statistics[0].statistics[numbers[index]],
                            statisticAway:
                                statistics[1].statistics[numbers[index]],
                          ),
                          itemCount: numbers.length,
                        ),
                      ],
                    )),
              ],
            ),
          )
        : showNoStats(context);
  }

  Widget showNoStats(BuildContext context) => SizedBox(
        height: context.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(AppAssets.noStats),
              width: AppSize.s200,
              height: AppSize.s200,
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              AppStrings.noStats,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.blueGrey, letterSpacing: 1.1),
            ),
          ],
        ),
      );

  Widget buildStatsRow(
          {required Statistic statisticHome,
          required BuildContext context,
          required Statistic statisticAway}) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: R.sH(context, 5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(statisticHome.value, textAlign: TextAlign.center),
            SizedBox(
              width: R.sW(context, 140),
              child: Text(
                statisticHome.type,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            Text(statisticAway.value, textAlign: TextAlign.center),
          ],
        ),
      );
}
