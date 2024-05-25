import 'package:Goal/src/container_injector.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/favourite/presentation/cubit/team_cubit/favourite_cubit.dart';
import 'package:Goal/src/features/favourite/presentation/cubit/team_cubit/favourite_state.dart';
import 'package:Goal/src/features/favourite/presentation/widgets/players_grid.dart';
import 'package:Goal/src/features/favourite/presentation/widgets/teams_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/core/utils/app_colors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouriteCubit>(
      create: (context) => sl<FavouriteCubit>(),
      child: BlocConsumer<FavouriteCubit, FavouriteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                actionsIconTheme: const IconThemeData(color: AppColors.white),
                centerTitle: false,
                title: const Text("Favourites",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(R.sH(context, 30)),
                    child: Row(
                      children: [
                        TabBar(
                          controller: controller,
                          tabAlignment: TabAlignment.start,
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: R.sW(context, 10),
                          ),
                          physics: const BouncingScrollPhysics(),
                          dividerColor: Colors.transparent,
                          indicator: UnderlineTabIndicator(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(R.sR(context, 10)),
                                  topRight: Radius.circular(R.sR(context, 10))),
                              borderSide: BorderSide(
                                color: AppColors.green,
                                width: R.sW(context, 3),
                              ),
                              insets: EdgeInsets.symmetric(
                                  horizontal: R.sH(context, 2))),
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.white70,
                          isScrollable: true,
                          indicatorWeight: R.sW(context, 3),
                          tabs: const [
                            Tab(text: "Teams"),
                            Tab(text: "Players"),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ))),
            body: TabBarView(
              controller: controller,
              children: const <Widget>[
                TeamsGridView(),
                PlayersGrid(),
              ],
            ),
          );
        },
      ),
    );
  }
}
