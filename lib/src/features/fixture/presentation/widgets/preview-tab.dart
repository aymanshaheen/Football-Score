import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_assets.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_size.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/widgets/circular_indicator.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/domain/entities/events.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/items_not_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewTab extends StatelessWidget {
  final SoccerFixture match;
  const PreviewTab({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FixtureCubit, FixtureState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FixtureEventsLoading) {
            return const Center(
              child: CircularIndicator(),
            );
          } else if (FixtureCubit.get(context).events.isEmpty) {
            return const ItemsNotAvailable(
              message: AppStrings.noEvents,
              icon: Icons.event_busy,
            );
          }
          return SingleChildScrollView(
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsetsDirectional.all(R.sW(context, 10)),
                      child: eventDetails(
                          FixtureCubit.get(context).events[index], context),
                    ),
                    itemCount: FixtureCubit.get(context).events.length,
                  ),
                ),
                SizedBox(height: R.sH(context, 10)),
              ],
            ),
          );
        });
  }

  Widget eventDetails(Event event, BuildContext context) => Directionality(
        textDirection: event.team.id == match.teams.home.id
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Column(
          children: [
            if (event.type == AppStrings.goal) eventGoal(event, context),
            if (event.type == AppStrings.card) eventCard(event, context),
            if (event.type == AppStrings.subst) eventSubset(event, context)
          ],
        ),
      );

  Widget eventSubset(Event event, BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            event.time.toString(),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: R.sW(context, 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: R.sW(context, 15),
                    height: R.sW(context, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 6, 163, 32),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: AppColors.white,
                        size: R.sW(context, 14),
                      ),
                    ),
                  ),
                  SizedBox(width: R.sW(context, 15)),
                  Text(
                    event.playerName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: R.F(context, 14),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: R.sW(context, 15),
                    height: R.sW(context, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 163, 6, 6),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: AppColors.white,
                        size: R.sW(context, 14),
                      ),
                    ),
                  ),
                  SizedBox(width: R.sW(context, 15)),
                  Text(
                    event.assistName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: R.F(context, 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Widget eventCard(Event event, BuildContext context) => Row(
        children: [
          Text(
            event.time.toString(),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: R.sW(context, 15)),
          Container(
            width: R.sW(context, 14),
            height: R.sH(context, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: event.detail == AppStrings.yellowCard
                  ? AppColors.yellow
                  : AppColors.red,
            ),
          ),
          SizedBox(width: R.sW(context, 15)),
          Text(
            event.playerName,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 14),
            ),
          ),
        ],
      );

  Widget eventGoal(Event event, BuildContext context) => Row(
        children: [
          Text(
            event.time.toString(),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.white,
              fontSize: R.F(context, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: R.sW(context, 15)),
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.asset(AppAssets.ball,
                width: R.sW(context, 20), height: R.sH(context, 20)),
          ),
          SizedBox(width: R.sW(context, 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.playerName,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: R.F(context, 14),
                ),
              ),
              Text(
                "assist by ${event.assistName}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: R.F(context, 14),
                ),
              ),
            ],
          ),
        ],
      );

  Widget penaltyMissed() => const Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Icon(Icons.sports_soccer, size: AppSize.s30),
          CircleAvatar(
            radius: AppSize.s8,
            backgroundColor: AppColors.red,
            child: Icon(Icons.close, color: AppColors.white, size: AppSize.s10),
          ),
        ],
      );
}
