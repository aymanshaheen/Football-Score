import 'package:Goal/src/features/soccer/data/repositories/soccer_repository_impl.dart';
import 'package:Goal/src/features/soccer/domain/use_cases/standings_usecase.dart';
import 'package:Goal/src/features/team/data/datasources/team_data_source.dart';
import 'package:Goal/src/features/team/data/repositories/team_repository.dart';
import 'package:Goal/src/features/team/domain/use_cases/add_favourite.dart';
import 'package:Goal/src/features/team/domain/use_cases/delete_favourite.dart';
import 'package:Goal/src/features/team/domain/use_cases/last_matches_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/next_match_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/player_squad_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/statistics_use_case.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';
import '../../container_injector.dart';
import '../../core/api/dio_helper.dart';
import '../../core/network/network_info.dart';

void initTeam() {
  sl.registerLazySingleton<TeamDataSourceImpl>(
    () => TeamDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton<TeamRepositoryImpl>(
    () => TeamRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      teamDataSource: sl<TeamDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton<StatisticsUseCase>(
    () => StatisticsUseCase(
      teamRepository: sl<TeamRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<LastMatchesUseCase>(
    () => LastMatchesUseCase(
      teamRepository: sl<TeamRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<StandingsUseCase>(
    () => StandingsUseCase(
      soccerRepository: sl<SoccerRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<AddFavouriteUseCase>(
    () => AddFavouriteUseCase(
      teamRepository: sl<TeamRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<DeleteFavouriteUseCase>(
    () => DeleteFavouriteUseCase(
      teamRepository: sl<TeamRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<NextMatchesUseCase>(
    () => NextMatchesUseCase(
      teamRepository: sl<TeamRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<PlayerSquadUseCase>(
    () => PlayerSquadUseCase(
      teamRepository: sl<TeamRepositoryImpl>(),
    ),
  );
  sl.registerFactory<TeamCubit>(
    () => TeamCubit(
      teamUseCase: sl<StatisticsUseCase>(),
      addFavouriteUseCase: sl<AddFavouriteUseCase>(),
      deleteFavouriteUseCase: sl<DeleteFavouriteUseCase>(),
      lastMatchesUseCase: sl<LastMatchesUseCase>(),
      nextMatchesUseCase: sl<NextMatchesUseCase>(),
      standingUseCase: sl<StandingsUseCase>(),
      playerSquadUseCase: sl<PlayerSquadUseCase>(),
    ),
  );
}
