import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_values.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/fixture_card.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LeagueMatchesTab extends StatefulWidget {
  final List<SoccerFixture> leagueMatches;
  const LeagueMatchesTab({super.key, required this.leagueMatches});

  @override
  State<LeagueMatchesTab> createState() => _LeagueMatchesTabState();
}

class _LeagueMatchesTabState extends State<LeagueMatchesTab> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = calculateIndex();
      itemScrollController.jumpTo(index: index);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  int calculateIndex() {
    Map<String, List<SoccerFixture>> lastFixturesByDate = groupBy(
      widget.leagueMatches,
      (SoccerFixture fixture) => fixture.fixture.date,
    );

    String closestDate = lastFixturesByDate.keys.reduce((date1, date2) =>
        (DateTime.parse(date1).difference(DateTime.now()).abs() <
                DateTime.parse(date2).difference(DateTime.now()).abs())
            ? date1
            : date2);

    List<String> sortedDates = lastFixturesByDate.keys.toList()..sort();
    int index = sortedDates.indexOf(closestDate);

    return index;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<SoccerFixture>> lastFixturesByDate = groupBy(
      widget.leagueMatches,
      (SoccerFixture fixture) => fixture.fixture.date,
    );
    List<String> sortedDates = lastFixturesByDate.keys.toList()..sort();

    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        String date = sortedDates[index];
        List<SoccerFixture> fixtures = lastFixturesByDate[date]!;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.darkgrey,
            borderRadius: BorderRadius.circular(R.sW(context, 15)),
          ),
          padding: EdgeInsets.only(
              top: R.sH(context, 10),
              bottom: R.sH(context, 10),
              left: R.sW(context, 20),
              right: R.sW(context, 10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              DateFormat('EEE, MMM d').format(DateTime.parse(date)),
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: R.F(context, 14),
                  fontWeight: FontWeight.w600),
            ),
            _buildFixtureContainer(date, fixtures, context),
          ]),
        );
      },
    );
  }

  Widget _buildFixtureContainer(
      String date, List<SoccerFixture> fixtures, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: R.sH(context, 10)),
        Padding(
          padding: const EdgeInsets.only(right: AppPadding.p20),
          child: Column(children: [
            ...fixtures.map((fixture) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.fixture,
                    arguments: fixture,
                  );
                },
                child: FixtureCard(
                  soccerFixture: fixture,
                  isShowNextMatch: false,
                ),
              );
            }),
          ]),
        )
      ],
    );
  }
}
