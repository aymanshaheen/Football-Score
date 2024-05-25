import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/core/widgets/media_query.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/no_fixtures_today.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/view_fixtures.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/responsivity.dart';

class TabBarViewBuilder extends StatefulWidget {
  final TabController? _tabController;
  final List<DateTime> dates;
  final List<SoccerFixture> fixtures;

  const TabBarViewBuilder(this._tabController, this.dates, this.fixtures,
      {super.key});

  @override
  State<TabBarViewBuilder> createState() => _TabBarViewBuilderState();
}

class _TabBarViewBuilderState extends State<TabBarViewBuilder> {
  void _handleTabSelection() {
    if (widget._tabController!.indexIsChanging) {
      _scrollToSelectedTab();
    }
  }

  void _scrollToSelectedTab() {
    double tabScrollPosition = 0.0;
    for (int i = 0; i < widget._tabController!.index; i++) {
      tabScrollPosition += 1.0;
    }
    widget._tabController!.animateTo(tabScrollPosition.round());
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget._tabController,
      children: widget.dates.map((date) {
        return RefreshIndicator(
          onRefresh: () async {
            _handleTabSelection();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: R.sH(context, 10)),
              child: Column(
                children: widget.fixtures.isNotEmpty
                    ? List.generate(AppConstants.leaguesList.length, (index) {
                        bool isTaped = AppConstants
                            .leaguesFixtures[AppConstants.leaguesList[index]]!
                            .league
                            .isTapped;
                        return Column(
                          children: [
                            AnimatedSize(
                              alignment: Alignment.topCenter,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.linear,
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: R.sH(context, 10),
                                  left: R.sH(context, 10),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: R.sH(context, 10)),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(R.sR(context, 10)),
                                  color: AppColors.darkgrey,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: R.sH(context, 40),
                                      padding: EdgeInsets.only(
                                          top: R.sH(context, 5),
                                          bottom: R.sH(context, 5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                  image: NetworkImage(
                                                    AppConstants
                                                        .leaguesFixtures[
                                                            AppConstants
                                                                    .leaguesList[
                                                                index]]!
                                                        .league
                                                        .logo,
                                                  ),
                                                  height: R.sH(context, 30),
                                                  width: R.sH(context, 30)),
                                              SizedBox(width: R.sW(context, 5)),
                                              Text(
                                                AppConstants
                                                    .leaguesFixtures[
                                                        AppConstants
                                                                .leaguesList[
                                                            index]]!
                                                    .league
                                                    .name,
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: R.F(context, 14),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                AppConstants
                                                        .leaguesFixtures[
                                                            AppConstants
                                                                    .leaguesList[
                                                                index]]!
                                                        .league
                                                        .isTapped =
                                                    !AppConstants
                                                        .leaguesFixtures[
                                                            AppConstants
                                                                    .leaguesList[
                                                                index]]!
                                                        .league
                                                        .isTapped;
                                              });
                                            },
                                            icon: Icon(
                                              isTaped
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: AppColors.white,
                                              size: R.F(context, 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isTaped) ...[
                                      const Divider(
                                        color: AppColors.black,
                                        thickness: 1,
                                      ),
                                      ViewDayFixtures(
                                          fixtures: AppConstants
                                              .leaguesFixtures[AppConstants
                                                  .leaguesList[index]]!
                                              .fixtures),
                                    ],
                                    SizedBox(
                                      height: R.sH(context, 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: R.sH(context, 10)),
                          ],
                        );
                      })
                    : [
                        SizedBox(
                            height: context.height / 2,
                            child: const NoFixturesToday())
                      ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
