import 'package:Goal/src/core/widgets/circular_indicator.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/tab_bar_builder.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/soccer_cubit.dart';
import '../cubit/soccer_state.dart';
import '../../../../core/domain/entities/soccer_fixture.dart';

class SoccerScreen extends StatefulWidget {
  const SoccerScreen({super.key});

  @override
  State<SoccerScreen> createState() => _SoccerScreenState();
}

class _SoccerScreenState extends State<SoccerScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<DateTime> dates = List<DateTime>.generate(
      30, (i) => DateTime.now().subtract(Duration(days: 15 - i)));
  List<SoccerFixture> fixtures = [];
  List<SoccerFixture> liveFixtures = [];

  @override
  void initState() {
    super.initState();
    int initialIndex =
        dates.indexWhere((date) => date.day == DateTime.now().day);
    _tabController = TabController(
        length: dates.length, vsync: this, initialIndex: initialIndex);
    _tabController!.addListener(_handleTabSelection);
    getLists();
  }

  void _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      _scrollToSelectedTab();
    }
    getFixtures(dates[_tabController!.index]);
  }

  void _scrollToSelectedTab() {
    double tabScrollPosition = 0.0;
    for (int i = 0; i < _tabController!.index; i++) {
      tabScrollPosition += 1.0;
    }
    _tabController!.animateTo(tabScrollPosition.round());
  }

  getFixtures(DateTime date) async {
    SoccerCubit cubit = context.read<SoccerCubit>();
    fixtures = await cubit.getFixtures(DateFormat("yyyy-MM-dd").format(date));
    setState(() {});
  }

  getLists() async {
    SoccerCubit cubit = context.read<SoccerCubit>();

    if (cubit.filteredLeagues.isEmpty) {
      await cubit.getLeagues();
    }
    if (cubit.filteredLeagues.isNotEmpty) {
      fixtures = [];
      _handleTabSelection();
    }
  }

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabSelection);
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoccerCubit, SoccerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Text(
              AppStrings.footballista,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(R.sH(context, 50)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: R.sW(context, 10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBarBuilder(_tabController, dates),
                  ],
                ),
              ),
            ),
          ),
          body: state is SoccerFixturesLoading || state is SoccerLeaguesLoading
              ? const CircularIndicator()
              : TabBarViewBuilder(_tabController, dates,fixtures),
        );
      },
    );
  }
}

Gradient getGradientColor(SoccerFixture fixture) {
  Gradient color = AppColors.blueGradient;
  if (fixture.goals.away != fixture.goals.home) {
    color = AppColors.redGradient;
  }
  return color;
}
