import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/fixture_card.dart';
import 'package:flutter/material.dart';

class NextMatchContainer extends StatelessWidget {
  final SoccerFixture match;
  final String formattedTime;

  const NextMatchContainer({
    super.key,
    required this.match,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(R.sW(context, 10)),
      height: R.sH(context, 152),
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(R.sR(context, 10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.nextMatch,
            style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 14),
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: R.sH(context, 3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: R.F(context, 12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: R.sW(context, 90),
                  height: R.sH(context, 18),
                  margin: const EdgeInsets.only(bottom: 19, top: 19),
                  decoration: BoxDecoration(
                    color: AppColors.white50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(match.fixtureLeague.name,
                        style: TextStyle(
                            color: AppColors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: R.F(context, 12))),
                  ),
                )
              ],
            ),
          ),
          FixtureCard(
            soccerFixture: match,
            isShowNextMatch: false,
          ),
        ],
      ),
    );
  }
}
