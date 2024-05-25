import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:flutter/material.dart';

class LastFiveMatchesContainer extends StatelessWidget {
  final TeamStatistics? teamStatistics;
  final List<SoccerFixture> lastMatches;
  final Team team;

  const LastFiveMatchesContainer({
    super.key,
    required this.teamStatistics,
    required this.lastMatches,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(R.sW(context, 12)),
      height: R.sH(context, 130),
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(R.sR(context, 10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.last5Match,
            style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 14),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: R.sH(context, 10)),
          Expanded(
            child: ListView.separated(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: R.sH(context, 25),
                        width: R.sW(context, 40),
                        decoration: BoxDecoration(
                          color: teamStatistics!.form![index] == "L"
                              ? AppColors.red
                              : teamStatistics!.form![index] == "W"
                                  ? AppColors.darkgreen
                                  : AppColors.white50,
                          borderRadius: BorderRadius.circular(R.sR(context, 5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              lastMatches[index].goals.home.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.white70),
                            ),
                            Text(
                              ":",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.white70),
                            ),
                            Text(
                              lastMatches[index].goals.away.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: AppColors.white70),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: R.sH(context, 15)),
                      SizedBox(
                        height: R.sH(context, 30),
                        width: R.sW(context, 30),
                        child: Center(
                          child: Image(
                            image: NetworkImage(
                              lastMatches[index].teams.away.id != team.id
                                  ? lastMatches[index].teams.away.logo
                                  : lastMatches[index].teams.home.logo,
                            ),
                            height: R.sH(context, 30),
                            width: R.sW(context, 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: R.sW(context, 28));
              },
            ),
          ),
        ],
      ),
    );
  }
}
