import 'package:Goal/src/container_injector.dart';
import 'package:Goal/src/core/api/dio_helper.dart';
import 'package:Goal/src/core/network/network_info.dart';
import 'package:Goal/src/features/league/data/datasources/league_data_source.dart';
import 'package:Goal/src/features/league/data/repositories/league_repository.dart';
import 'package:Goal/src/features/league/domain/use_case/league_info_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/league_match_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_asistis_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_red_card_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_scorers_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_yellow_card_use_case.dart';
import 'package:Goal/src/features/league/presentation/cubit/league_cubit/league_cubit.dart';

void initLeague() {
  sl.registerLazySingleton<LeagueDataSourceImpl>(
    () => LeagueDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton<LeagueRepositoryImpl>(
    () => LeagueRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      leagueDataSource: sl<LeagueDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton<TopAsisitisUseCase>(
      () => TopAsisitisUseCase(leagueRepository: sl<LeagueRepositoryImpl>()));
  sl.registerLazySingleton<TopRedCardsUseCase>(
      () => TopRedCardsUseCase(leagueRepository: sl<LeagueRepositoryImpl>()));
  sl.registerLazySingleton<TopScorersUseCase>(
      () => TopScorersUseCase(leagueRepository: sl<LeagueRepositoryImpl>()));
  sl.registerLazySingleton<LeagueInfoUseCase>(
      () => LeagueInfoUseCase(leagueRepository: sl<LeagueRepositoryImpl>()));
  sl.registerLazySingleton<TopYellowCardsUseCase>(() =>
      TopYellowCardsUseCase(leagueRepository: sl<LeagueRepositoryImpl>()));
  sl.registerLazySingleton<LeagueMatchesUseCase>(
      () => LeagueMatchesUseCase(leagueRepository: sl<LeagueRepositoryImpl>()));
  sl.registerLazySingleton<LeagueInfoCubit>(() => LeagueInfoCubit(
        leagueInfoUseCase: sl<LeagueInfoUseCase>(),
        topScorersUseCase: sl<TopScorersUseCase>(),
        topAsisitisUseCase: sl<TopAsisitisUseCase>(),
        topRedCardsUseCase: sl<TopRedCardsUseCase>(),
        topYellowCardsUseCase: sl<TopYellowCardsUseCase>(),
        leagueMatchesUseCase: sl<LeagueMatchesUseCase>(),
      ));
}
