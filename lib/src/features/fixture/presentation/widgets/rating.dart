import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';

class PlayerRating extends StatelessWidget {
  final String playerStatistics;

  const PlayerRating({super.key, required this.playerStatistics});

  @override
  Widget build(BuildContext context) {
    double rating = double.parse(playerStatistics);

    Color ratingColor;
    if (rating < 5) {
      ratingColor = AppColors.red;
    } else if (rating < 7) {
      ratingColor = AppColors.yellow;
    } else if (rating < 9) {
      ratingColor = AppColors.green;
    } else {
      ratingColor = AppColors.blue;
    }

    return Positioned(
      left: 35,
      child: Container(
        width: R.sW(context, 30),
        padding: EdgeInsets.symmetric(vertical: R.sH(context, 2)),
        decoration: BoxDecoration(
          color: ratingColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            playerStatistics,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
