import 'package:Goal/src/features/fixture/domain/use_cases/h2h_use_case.dart';
import 'package:Goal/src/features/fixture/domain/use_cases/players_statistics_use_case.dart';

import '../../container_injector.dart';
import '../../core/api/dio_helper.dart';
import '../../core/network/network_info.dart';
import 'data/data_sources/fixture_data_source.dart';
import 'data/repositories/fixture_repository_impl.dart';
import 'domain/use_cases/events_usecase.dart';
import 'domain/use_cases/lineups_usecase.dart';
import 'domain/use_cases/statistics_usecase.dart';
import 'presentation/cubit/fixture_cubit.dart';

void initFixture() {
  sl.registerLazySingleton<FixtureDataSourceImpl>(
    () => FixtureDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton(
    () => FixtureRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      fixtureDataSource: sl<FixtureDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton(
    () => StatisticUseCase(fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => LineupsUseCase(fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => EventsUseCase(fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => H2HUseCase(fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => PlayersStatisticsUseCase(
        fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerFactory(
    () => FixtureCubit(
      h2hUseCase: sl<H2HUseCase>(),
      eventsUseCase: sl<EventsUseCase>(),
      lineupsUseCase: sl<LineupsUseCase>(),
      statisticsUseCase: sl<StatisticUseCase>(),
      playersStatisticsUseCase: sl<PlayersStatisticsUseCase>(),
    ),
  );
}
