import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Goal/src/config/app_route.dart';
import '../../../../core/domain/entities/soccer_fixture.dart';
import '../../../../core/utils/app_colors.dart';

import 'view_team.dart';

class FixtureDetails extends StatelessWidget {
  final SoccerFixture soccerFixture;

  const FixtureDetails({super.key, required this.soccerFixture});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: R.sH(context, 5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.team,
                        arguments: [soccerFixture, soccerFixture.teams.home],
                      );
                    },
                    child: ViewTeam(team: soccerFixture.teams.home)),
              ),
              (soccerFixture.fixture.status.elapsed != null)
                  ? Expanded(child: buildFixtureResult(context))
                  : Expanded(child: buildFixtureTime(context)),
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.team,
                        arguments: [soccerFixture, soccerFixture.teams.away],
                      );
                    },
                    child: ViewTeam(team: soccerFixture.teams.away)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFixtureResult(BuildContext context) {
    TextStyle? displaySmall = Theme.of(context)
        .textTheme
        .displaySmall
        ?.copyWith(color: AppColors.white);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              soccerFixture.goals.home.toString(),
              style: displaySmall,
            ),
            SizedBox(width: R.sW(context, 10)),
            Text(
              ":",
              style: displaySmall,
            ),
            SizedBox(width: R.sW(context, 10)),
            Text(
              soccerFixture.goals.away.toString(),
              style: displaySmall,
            ),
          ],
        ),
        SizedBox(height: R.sH(context, 10)),
        Center(
          child: Text(
            soccerFixture.fixture.status.short != "FT"
                ? soccerFixture.fixture.status.elapsed.toString()
                : '',
            style: TextStyle(
                color: AppColors.white,
                fontSize: R.F(context, 14),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget buildFixtureTime(BuildContext context) {
    String fixtureTime = soccerFixture.fixture.date;
    final localTime = DateTime.parse(fixtureTime).toLocal();
    final formattedTime = DateFormat("h:mm a").format(localTime);

    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final difference = localTime.difference(now);

        final hours = difference.inHours;
        final minutes = difference.inMinutes.remainder(60);
        final seconds = difference.inSeconds.remainder(60);

        final timeUntilFixture = '$hours : $minutes : $seconds';

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            Text(
              formattedTime,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.white, fontSize: R.sW(context, 20)),
            ),
            SizedBox(height: R.sH(context, 10)),
            Text(
              timeUntilFixture,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.white70, fontSize: R.sW(context, 14)),
            ),
          ],
        );
      },
    );
  }
}
