import 'package:Goal/src/core/domain/entities/league.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class LeagueCard extends StatefulWidget {
  final League league;

  const LeagueCard({
    super.key,
    required this.league,
  });

  @override
  _LeagueCardState createState() => _LeagueCardState();
}

class _LeagueCardState extends State<LeagueCard> {
  late final ImageProvider imageProvider;

  @override
  void initState() {
    super.initState();
    imageProvider = NetworkImage(widget.league.logo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: R.sW(context, 5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                width: R.sW(context, 35),
                height: R.sW(context, 35),
                image: imageProvider,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
              SizedBox(width: R.sW(context, 10)),
              Text(
                widget.league.name.length > 30
                    ? widget.league.name.substring(0, 30)
                    : widget.league.name,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: R.F(context, 13),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.white70,
            size: R.sW(context, 13),
          ),
        ],
      ),
    );
  }
}
