import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/core/widgets/circular_image.dart';
import 'package:Goal/src/core/widgets/circular_indicator.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_cubit.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_state.dart';
import 'package:Goal/src/features/player/presentation/screens/player_profile_tab.dart';
import 'package:Goal/src/features/player/presentation/screens/player_stats_tab.dart';
import 'package:Goal/src/features/player/presentation/widgets/league_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/core/utils/app_colors.dart';

class PlayerScreen extends StatefulWidget {
  final String player;
  const PlayerScreen({
    super.key,
    required this.player,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  PlayerService? playerService;
  late bool isFavourite = false;
  @override
  void initState() {
    super.initState();
    PlayerCubit.get(context).playerStatsInfo = null;
    playerService = PlayerService(
      playerCubit: context.read<PlayerCubit>(),
    );
    controller = TabController(
      length: 2,
      vsync: this,
    );
    getList();
  }

  void getList() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(AppConstants.token)
        .collection('favorites')
        .doc('players')
        .collection('items')
        .doc(widget.player)
        .get();

    isFavourite = snapshot.exists;
    await playerService!.getLists(player: widget.player);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return PlayerCubit.get(context).playerStatsInfo == null
            ? const Scaffold(
                body: Center(
                  child: CircularIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                    actionsIconTheme:
                        const IconThemeData(color: AppColors.white),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.white,
                      ),
                    ),
                    actions: [
                      BlocBuilder<PlayerCubit, PlayerStates>(
                        builder: (context, state) {
                          if (state is AddFavouriteLoaded) {
                            isFavourite = true;
                          } else if (state is DeleteFavouriteLoaded) {
                            isFavourite = false;
                          }
                          return InkWell(
                            onTap: () {
                              if (isFavourite) {
                                PlayerCubit.get(context)
                                    .deleteFavourite(id: widget.player);
                              } else {
                                PlayerCubit.get(context).addFavourite(
                                  id: widget.player,
                                  photo: PlayerCubit.get(context)
                                      .playerStatsInfo!
                                      .playerInfo!
                                      .photo,
                                  name: PlayerCubit.get(context)
                                      .playerStatsInfo!
                                      .playerInfo!
                                      .name,
                                );
                              }
                            },
                            child: Container(
                              width: R.sW(context, 85),
                              margin: EdgeInsets.only(
                                  right: R.sW(context, 13),
                                  bottom: R.sH(context, 12),
                                  top: R.sH(context, 12)),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                                color: !isFavourite
                                    ? AppColors.darkgrey
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                    isFavourite ? "Following" : "Follow",
                                    style: TextStyle(
                                        color: isFavourite
                                            ? AppColors.darkgrey
                                            : AppColors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: R.F(context, 13))),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(R.sH(context, 120)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: R.sW(context, 15)),
                            child: Row(children: [
                              CircularImageBuilder(
                                  photo: PlayerCubit.get(context)
                                      .playerStatsInfo!
                                      .playerInfo!
                                      .photo,
                                  height: 70,
                                  width: 100),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    PlayerCubit.get(context)
                                        .playerStatsInfo!
                                        .playerInfo!
                                        .name,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: R.F(context, 20),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: R.sH(context, 5),
                                  ),
                                  Text(
                                    PlayerCubit.get(context)
                                        .playerStatsInfo!
                                        .statisticsInfo[0]
                                        .team
                                        .name,
                                    style: TextStyle(
                                        color: AppColors.white70,
                                        fontSize: R.F(context, 14),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ]),
                          ),
                          Row(
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
                                        topLeft:
                                            Radius.circular(R.sR(context, 10)),
                                        topRight:
                                            Radius.circular(R.sR(context, 10))),
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
                                  Tab(text: "Profile"),
                                  Tab(text: "Stats"),
                                ],
                              ),
                              Expanded(child: Container())
                            ],
                          )
                        ],
                      ),
                    )),
                body: state is PlayerLoading
                    ? const CircularIndicator()
                    : TabBarView(
                        controller: controller,
                        children: <Widget>[
                          PlayerOverViewTab(
                            playerStatsInfo:
                                PlayerCubit.get(context).playerStatsInfo!,
                          ),
                          PlayerStatsTab(
                            playerStatsInfo:
                                PlayerCubit.get(context).playerStatsInfo!,
                          ),
                        ],
                      ),
              );
      },
    );
  }
}
