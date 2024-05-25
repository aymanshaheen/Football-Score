import 'package:flutter/material.dart';
import '../../../../config/app_route.dart';
import '../../../../core/domain/entities/soccer_fixture.dart';
import '../../../../core/utils/app_values.dart';
import 'fixture_card.dart';


class ViewDayFixtures extends StatelessWidget {
  final List<SoccerFixture> fixtures;

  const ViewDayFixtures({super.key, required this.fixtures});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(right: AppPadding.p20),
            child: Column(children: [
              ...List.generate(fixtures.length, (index) {
          
                return InkWell(
                  onTap:
                      () {
                    Navigator.of(context)
                        .pushNamed(Routes.fixture, arguments: fixtures[index]);
                  },
                  child: FixtureCard(
                      soccerFixture: fixtures[index], isShowNextMatch: false,
                      ),
                );
              }),
            ]),
          );
  }
}

