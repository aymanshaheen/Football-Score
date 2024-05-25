import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/presentation/widgets/standings_item.dart';
import 'package:flutter/material.dart';

class StatasTeamView extends StatelessWidget {
  final TeamStatistics? teamStatistics;

  const StatasTeamView({
    super.key,
    required this.teamStatistics,
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          AppStrings.points,
          style: TextStyle(
            color: AppColors.white,
            fontSize: R.F(context, 14),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: R.sH(context, 10)),
        Divider(
          color: AppColors.black,
          thickness: R.sW(context, 1),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: StandingsHeaders(),
        ),
      ]),
    );
  }
}
