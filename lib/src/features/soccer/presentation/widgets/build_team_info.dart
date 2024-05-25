import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_size.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';

class TeamBuild1Info extends StatelessWidget {
  final String logo;
  final String name;

  const TeamBuild1Info({super.key, required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: R.sW(context, 80),
            child: Text(
              name,
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeights.medium,
                  fontSize: R.F(context, 11),
                  color: AppColors.white),
            ),
          ),
          SizedBox(width: R.sW(context, 5)),
          Image(
            image: NetworkImage(
              logo,
            ),
            fit: BoxFit.cover,
            height: R.sH(context, 22),
            width: R.sW(context, 22),
          ),
        ],
      ),
    );
  }
}

class TeamBuild2Info extends StatelessWidget {
  final String logo;
  final String name;

  const TeamBuild2Info({super.key, required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(
              logo,
            ),
            fit: BoxFit.cover,
            height: R.sH(context, 22),
            width: R.sW(context, 22),
          ),
          SizedBox(width: R.sW(context, 5)),
          SizedBox(
            width: R.sW(context, 80),
            child: Text(
              name,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeights.medium,
                  fontSize: R.F(context, 11),
                  color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
