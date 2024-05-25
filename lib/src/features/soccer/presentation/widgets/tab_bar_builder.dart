import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/responsivity.dart';

class TabBarBuilder extends StatelessWidget {
  final TabController? _tabController;
  final List<DateTime> dates;

  const TabBarBuilder(this._tabController, this.dates, {super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      labelPadding: EdgeInsets.symmetric(
        horizontal: R.sW(context, 10),
      ),
      physics: const BouncingScrollPhysics(),
      dividerColor: Colors.transparent,
      controller: _tabController,
      indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(R.sR(context, 10)),
              topRight: Radius.circular(R.sR(context, 10))),
          borderSide: BorderSide(
            color: AppColors.green,
            width: R.sW(context, 3),
          ),
          insets: EdgeInsets.symmetric(horizontal: R.sH(context, 2))),
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.white70,
      isScrollable: true,
      indicatorWeight: R.sW(context, 3),
      tabs: dates.map((date) {
        String formattedDate = DateFormat('EEE d MMM').format(date);
        String today = DateFormat('EEE d MMM').format(DateTime.now());
        String tomorrow = DateFormat('EEE d MMM')
            .format(DateTime.now().add(const Duration(days: 1)));
        String yesterday = DateFormat('EEE d MMM')
            .format(DateTime.now().subtract(const Duration(days: 1)));

        if (formattedDate == today) {
          return const Tab(text: 'Today');
        } else if (formattedDate == tomorrow) {
          return const Tab(text: 'Tomorrow');
        } else if (formattedDate == yesterday) {
          return const Tab(text: 'Yesterday');
        } else {
          return Tab(text: formattedDate);
        }
      }).toList(),
    );
  }
}
