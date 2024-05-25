import 'package:Goal/src/container_injector.dart';
import 'package:Goal/src/core/api/dio_helper.dart';
import 'package:Goal/src/core/network/network_info.dart';
import 'package:Goal/src/features/player/data/datasources/player_data_source.dart';
import 'package:Goal/src/features/player/data/repositories/Player_repository.dart';
import 'package:Goal/src/features/player/domain/use_case/add_favourite.dart';
import 'package:Goal/src/features/player/domain/use_case/delete_favourite.dart';
import 'package:Goal/src/features/player/domain/use_case/player_info_use_case.dart';
import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_cubit.dart';


void initPlayer() {
  sl.registerLazySingleton<PlayerDataSourceImpl>(
    () => PlayerDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton<PlayerRepositoryImpl>(
    () => PlayerRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      playerDataSource: sl<PlayerDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton<PlayerInfoUseCase>(
    () => PlayerInfoUseCase(
      playerRepository: sl<PlayerRepositoryImpl>(),
    ),
  );
    sl.registerLazySingleton<AddFavouriteUseCase>(
    () => AddFavouriteUseCase(
      teamRepository: sl<PlayerRepositoryImpl>(),
    ),
  );
  sl.registerLazySingleton<DeleteFavouriteUseCase>(
    () => DeleteFavouriteUseCase(
      teamRepository: sl<PlayerRepositoryImpl>(),
    ),
  );
 sl.registerLazySingleton(() => PlayerCubit(
  addFavouriteUseCase: sl<AddFavouriteUseCase>(),
  deleteFavouriteUseCase: sl<DeleteFavouriteUseCase>(),
  playerUseCase: sl<PlayerInfoUseCase>(),
));
}
