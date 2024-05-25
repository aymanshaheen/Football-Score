import 'package:Goal/src/core/domain/entities/league.dart';
import 'package:Goal/src/core/widgets/page_transition.dart';
import 'package:Goal/src/features/auth/presentation/pages/credential/forgot_password_page.dart';
import 'package:Goal/src/features/auth/presentation/pages/credential/login_page.dart';
import 'package:Goal/src/features/auth/presentation/pages/credential/sign_up_page.dart';
import 'package:Goal/src/features/fixture/presentation/screens/match_screen.dart';
import 'package:Goal/src/features/league/presentation/cubit/league_cubit/league_cubit.dart';
import 'package:Goal/src/features/league/presentation/screens/league_screen.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_cubit.dart';
import 'package:Goal/src/features/player/presentation/screens/player_screen.dart';
import 'package:Goal/src/features/soccer/presentation/screens/leagues_screen.dart';
import 'package:Goal/src/features/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import 'package:Goal/src/features/team/presentation/screens/team_screen.dart';
import '../container_injector.dart';
import '../core/domain/entities/soccer_fixture.dart';
import '../core/utils/app_strings.dart';
import '../features/fixture/presentation/cubit/fixture_cubit.dart';
import '../features/soccer/presentation/cubit/soccer_cubit.dart';
import '../features/soccer/presentation/screens/soccer_layout.dart';
import '../features/soccer/presentation/screens/soccer_screen.dart';

class Routes {
  static const String soccerLayout = "soccerLayout";
  static const String soccer = "soccer";
  static const String fixtures = "fixtures";
  static const String leagues = "leagues";
  static const String league = "league";
  static const String fixture = "fixture";
  static const String team = "team";
  static const String splash = "splash";
  static const String player = "player";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String foreget = "foreget";
}

class AppRouter {
  static Route routesGenerator(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.login:
        return FadeRoute(
          builder: (context) => const LoginPage(),
        );
      case Routes.foreget:
        return FadeRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case Routes.signUp:
        return FadeRoute(
          builder: (context) => const SignUpPage(),
        );

      case Routes.soccerLayout:
        return FadeRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<SoccerCubit>(),
            child: const SoccerLayout(),
          ),
        );
      case Routes.soccer:
        return FadeRoute(
          builder: (context) => BlocProvider.value(
            value: sl<SoccerCubit>(),
            child: const SoccerScreen(),
          ),
        );
    
      case Routes.fixture:
        return FadeRoute(
          builder: (context) {
            SoccerFixture soccerFixture = settings.arguments as SoccerFixture;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<FixtureCubit>(),
                ),
                BlocProvider(
                  create: (context) => sl<TeamCubit>(),
                ),
              ],
              child: MatchScreen(soccerFixture: soccerFixture),
            );
          },
        );
      case Routes.player:
        return FadeRoute(
          builder: (context) {
            String player = settings.arguments as String;
            return BlocProvider.value(
              value: sl<PlayerCubit>(),
              child: PlayerScreen(
                player: player,
              ),
            );
          },
        );
      case Routes.leagues:
        return FadeRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => sl<SoccerCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<LeagueInfoCubit>(),
            ),
          ], child: const AllLeaguesScreen()),
        );
      case Routes.team:
        return FadeRoute(builder: (context) {
          List<dynamic> args = settings.arguments as List<dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<TeamCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<PlayerCubit>(),
              )
            ],
            child: TeamScreen(
              soccerFixture: args[0],
              team: args[1],
            ),
          );
        });
      case Routes.league:
        return FadeRoute(builder: (context) {
          League league = settings.arguments as League;
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: sl<LeagueInfoCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<TeamCubit>(),
              ),
            ],
            child: LeagueInfoScreen(
              league: league,
            ),
          );
        });
    }

    return MaterialPageRoute(builder: (context) => const NoRouteFound());
  }
}

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text(AppStrings.noRouteFound)),
      );
}
