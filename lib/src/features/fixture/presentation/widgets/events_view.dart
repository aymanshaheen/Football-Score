import 'package:Goal/src/core/widgets/circular_indicator.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/fixture/presentation/cubit/fixture_cubit.dart';
import 'package:Goal/src/features/fixture/presentation/widgets/items_not_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/events.dart';

class EventsView extends StatelessWidget {
  final List<Event> events;

  const EventsView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixtureCubit, FixtureState>(builder: (context, state) {
      if (state is FixtureEventsLoading) {
        return const Center(
          child: CircularIndicator(),
        );
      } else if (events.isEmpty) {
        return const ItemsNotAvailable(
          message: AppStrings.noEvents,
          icon: Icons.event_busy,
        );
      }
      return Padding(
        padding: const EdgeInsets.all(AppPadding.p2),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Card(
            color: AppColors.darkgrey,
            child: Padding(
              padding: EdgeInsetsDirectional.all(R.sW(context, 15)),
              child: eventDetails(events[index], context),
            ),
          ),
          itemCount: events.length,
        ),
      );
    });
  }

  Widget eventDetails(Event event, BuildContext context) => Column(
        children: [
          Row(children: [
            Container(
              width: R.sW(context, 30),
              height: R.sH(context, 30),
              decoration: BoxDecoration(
                color: event.type == AppStrings.goal
                    ? AppColors.green
                    : event.type != AppStrings.card
                        ? AppColors.white
                        : event.detail == AppStrings.yellowCard
                            ? AppColors.yellow
                            : AppColors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  event.time.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.black),
                ),
              ),
            ),
            const SizedBox(width: AppSize.s10),
            Text(
              event.type == AppStrings.goal ? "Goal" : event.detail,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: event.type == AppStrings.goal
                        ? AppColors.green
                        : event.type != AppStrings.card
                            ? AppColors.white
                            : event.detail == AppStrings.yellowCard
                                ? AppColors.yellow
                                : AppColors.red,
                  ),
            ),
          ]),
          SizedBox(height: R.sH(context, 20)),
          if (event.type == AppStrings.goal) eventGoal(event, context),
          if (event.type == AppStrings.card) eventCard(event, context),
          if (event.type == AppStrings.subst) eventSubset(event, context)
        ],
      );

  Widget eventSubset(Event event, BuildContext context) => Column(
        children: [
          Container(
            height: R.sH(context, 35),
            padding: EdgeInsets.symmetric(horizontal: R.sW(context, 10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 91, 88, 88),
            ),
            child: Row(
              children: [
               Image(
  image: NetworkImage(event.team.logo),
  width: R.sW(context, 20),
  height: R.sH(context, 20),
),
                SizedBox(width: R.sW(context, 5)),
                Text(
                  event.playerName,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Container(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 6, 163, 32),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.white,
                      size: AppSize.s15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: R.sH(context, 10)),
          Container(
            height: R.sH(context, 35),
            padding: EdgeInsets.symmetric(horizontal: R.sW(context, 10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 91, 88, 88),
            ),
            child: Row(
              children: [
                Image(
  image: NetworkImage(event.team.logo),
  width: R.sW(context, 20),
  height: R.sH(context, 20),
),
                SizedBox(width: R.sW(context, 5)),
                Text(
                  event.assistName,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Container(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 200, 6, 6),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColors.white,
                      size: AppSize.s15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget eventCard(Event event, BuildContext context) => Container(
        height: R.sH(context, 35),
        padding: EdgeInsets.symmetric(horizontal: R.sW(context, 10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 91, 88, 88),
        ),
        child: Row(
          children: [
           Image(
  image: NetworkImage(event.team.logo),
  width: R.sW(context, 20),
  height: R.sH(context, 20),
),
            SizedBox(width: R.sW(context, 5)),
            Text(
              event.playerName,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Container(
              width: AppSize.s15,
              height: AppSize.s20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: event.detail == AppStrings.yellowCard
                    ? AppColors.yellow
                    : AppColors.red,
              ),
            ),
          ],
        ),
      );

  Widget eventGoal(Event event, BuildContext context) => Column(
        children: [
          Container(
            height: R.sH(context, 35),
            padding: EdgeInsets.symmetric(horizontal: R.sW(context, 10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 91, 88, 88),
            ),
            child: Row(
              children: [
              Image(
  image: NetworkImage(event.team.logo),
  width: R.sW(context, 20),
  height: R.sH(context, 20),
),
                SizedBox(width: R.sW(context, 5)),
                Text(
                  event.playerName,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Container(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 6, 163, 32),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.g_mobiledata_sharp,
                      color: AppColors.white,
                      size: AppSize.s15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: R.sH(context, 10)),
          Container(
            height: R.sH(context, 35),
            padding: EdgeInsets.symmetric(horizontal: R.sW(context, 10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 91, 88, 88),
            ),
            child: Row(
              children: [
               Image(
  image: NetworkImage(event.team.logo),
  width: R.sW(context, 20),
  height: R.sH(context, 20),
),
                SizedBox(width: R.sW(context, 5)),
                Text(
                  event.assistName,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Container(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 6, 163, 32),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.local_parking_rounded,
                      color: AppColors.white,
                      size: AppSize.s15,
                    ),
                  ),
                ),
              ],
            ),
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
