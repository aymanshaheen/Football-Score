import 'package:Goal/src/core/error/response_status.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/block_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/features/soccer/presentation/widgets/bottom_navigation_bar.dart';
import '../cubit/soccer_cubit.dart';
import '../cubit/soccer_state.dart';

class SoccerLayout extends StatelessWidget {
  const SoccerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoccerCubit, SoccerStates>(
      listener: (context, state) {
        if (state is SoccerLeaguesLoaded &&
            SoccerCubit.get(context).allLeagues.isEmpty) {
          buildBlockAlert(context: context, message: AppStrings.reachedLimits);
        }
        if (state is SoccerFixturesLoadFailure &&
            state.message ==
                DataSource.networkConnectError.getFailure().message) {
          buildBlockAlert(context: context, message: state.message);
        }
        if (state is SoccerLeaguesLoadFailure &&
            state.message ==
                DataSource.networkConnectError.getFailure().message) {
          buildBlockAlert(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        SoccerCubit cubit = context.read<SoccerCubit>();
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigation(cubit: cubit),
        );
      },
    );
  }
}
