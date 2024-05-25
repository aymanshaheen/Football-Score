import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/domain/entities/soccer_fixture.dart';
import 'build_team_info.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_values.dart';

class FixtureCard extends StatelessWidget {
  final SoccerFixture soccerFixture;
  final bool isShowNextMatch;

  const FixtureCard(
      {super.key, required this.soccerFixture, required this.isShowNextMatch});

  @override
  Widget build(BuildContext context) {
    String fixtureTime = soccerFixture.fixture.date;
    final localTime = DateTime.parse(fixtureTime).toLocal();
    final formattedTime = DateFormat("h:mm a").format(localTime);
    final formattedMatchTime = DateFormat("EEE, d MMM").format(localTime);
    return Container(
      color: AppColors.darkgrey,
      margin: EdgeInsets.only(
        bottom: R.sH(context, 5),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: R.sW(context, 5), vertical: R.sH(context, 7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShowNextMatch)
              Padding(
                  padding: EdgeInsets.only(bottom: R.sH(context, 10)),
                  child: Text(
                    formattedMatchTime.toString(),
                    style: const TextStyle(
                        color: AppColors.white70,
                        fontSize: FontSize.paragraph,
                        fontWeight: FontWeight.w500),
                  )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                soccerFixture.fixture.status.short != "NS"
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: R.sW(context, 6),
                            vertical: R.sH(context, 5)),
                        decoration: BoxDecoration(
                          color: soccerFixture.fixture.status.short != "FT"
                              ? AppColors.darkGreen
                              : const Color.fromARGB(255, 55, 53, 53),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            soccerFixture.fixture.status.short != "FT"
                                ? soccerFixture.fixture.status.elapsed
                                    .toString()
                                : "FT",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: R.F(context, 10),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: R.sW(context, 15),
                      ),
                SizedBox(width: R.sW(context, 10)),
                TeamBuild1Info(
                  name: soccerFixture.teams.home.name,
                  logo: soccerFixture.teams.home.logo,
                ),
                (soccerFixture.fixture.status.short == "NS")
                    ? SizedBox(
                        width: R.sW(context, 60),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: R.sW(context, 2)),
                          child: Column(
                            children: [
                              Text(
                                formattedTime.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: AppColors.white70,
                                        fontSize: R.F(context, 12)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        width: R.sW(context, 50),
                        child: (soccerFixture.goals.home != null &&
                                soccerFixture.goals.away != null)
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: R.sW(context, 2)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          soccerFixture.goals.home.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: AppColors.white70),
                                        ),
                                        Text(
                                          ":",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: AppColors.white70),
                                        ),
                                        Text(
                                          soccerFixture.goals.away.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: AppColors.white70),
                                        ),
                                      ],
                                    ),
                                   
                                  ],
                                ),
                              )
                            : Container(
                                width: R.sW(context, 78),
                                padding: EdgeInsets.symmetric(
                                  horizontal: R.sW(context, 13),
                                  vertical: AppPadding.p5,
                                ),
                                child: Text(
                                  "waiting",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: AppColors.white70,
                                          fontSize: FontSize.paragraph),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                TeamBuild2Info(
                  name: soccerFixture.teams.away.name,
                  logo: soccerFixture.teams.away.logo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
