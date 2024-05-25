import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/core/utils/app_values.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/fixture_card.dart';
import 'package:flutter/material.dart';

class MatchesTab extends StatefulWidget {
  final List<SoccerFixture> nextMatches;
  final List<SoccerFixture> lastMatches;
  const MatchesTab(
      {super.key, required this.nextMatches, required this.lastMatches});

  @override
  State<MatchesTab> createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController!.jumpTo(_scrollController!.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(R.sW(context, 15)),
              ),
              padding: EdgeInsets.only(
                  top: R.sH(context, 10),
                  bottom: R.sH(context, 10),
                  left: R.sW(context, 20),
                  right: R.sW(context, 10)),
              child: Padding(
                padding: const EdgeInsets.only(right: AppPadding.p20),
                child: Column(children: [
                  ...List.generate(widget.lastMatches.length, (index) {
                    return InkWell(
                      onTap: () {
                        if (ModalRoute.of(context)?.isCurrent ?? false) {
                          Navigator.of(context).pushNamed(
                            Routes.fixture,
                            arguments: widget.lastMatches[index],
                          );
                        }
                      },
                      child: FixtureCard(
                        soccerFixture: widget.lastMatches[index],
                        isShowNextMatch: true,
                      ),
                    );
                  }),
                ]),
              )),
          SizedBox(height: R.sH(context, 20)),
          Container(
              decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(R.sW(context, 15)),
              ),
              padding: EdgeInsets.only(
                  top: R.sH(context, 10),
                  bottom: R.sH(context, 10),
                  left: R.sW(context, 20),
                  right: R.sW(context, 10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.upcoming,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: R.F(context, 14),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: R.sH(context, 10)),
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p20),
                    child: Column(children: [
                      ...List.generate(widget.nextMatches.length, (index) {
                        return InkWell(
                          onTap: () {
                            if (ModalRoute.of(context)?.isCurrent ?? false) {
                              Navigator.of(context).pushNamed(
                                Routes.fixture,
                                arguments: widget.nextMatches[index],
                              );
                            }
                          },
                          child: FixtureCard(
                            soccerFixture: widget.nextMatches[index],
                            isShowNextMatch: true,
                          ),
                        );
                      }),
                    ]),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
