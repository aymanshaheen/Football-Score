import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/league_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/soccer_cubit.dart';
import '../cubit/soccer_state.dart';

class AllLeaguesScreen extends StatefulWidget {
  const AllLeaguesScreen({super.key});

  @override
  State<AllLeaguesScreen> createState() => _AllLeaguesScreenState();
}

class _AllLeaguesScreenState extends State<AllLeaguesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoccerCubit, SoccerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SoccerCubit cubit = context.read<SoccerCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Text(
              AppStrings.league,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                vertical: R.sH(context, 8), horizontal: R.sW(context, 5)),
            child: Column(
              children: [
                SizedBox(height: R.sH(context, 3)),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: R.sH(context, 2),
                      horizontal: R.sW(context, 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white40.withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                      SizedBox(width: R.sW(context, 10)),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            cubit.searchLeagues(value);
                          },
                          decoration: InputDecoration(
                            hintText: AppStrings.findLeague,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.white70),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: R.sH(context, 7)),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: R.sH(context, 10)),
                        Padding(
                          padding: EdgeInsets.only(left: R.sW(context, 10)),
                          child: Text(
                            AppStrings.competition,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: R.F(context, 14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: R.sH(context, 10)),
                        Expanded(
                          child: ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: cubit.filteredLeagues.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: R.sH(context, 7)),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.league,
                                  arguments: cubit.filteredLeagues[index],
                                );
                              },
                              child: LeagueCard(
                                  league: cubit.filteredLeagues[index]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
