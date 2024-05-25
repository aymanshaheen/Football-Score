import 'package:Goal/src/features/favourite/data/datasources/data_source.dart';
import 'package:Goal/src/features/favourite/data/repositories/repository.dart';
import 'package:Goal/src/features/favourite/domain/use_cases/get_favourite.dart';
import 'package:Goal/src/features/favourite/domain/use_cases/get_players.dart';
import 'package:Goal/src/features/favourite/presentation/cubit/team_cubit/favourite_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../container_injector.dart';
import '../../core/api/dio_helper.dart';
import '../../core/network/network_info.dart';

void initFavourite() {
  sl.registerLazySingleton<FavouriteDataSourceImpl>(
    () => FavouriteDataSourceImpl(
        dioHelper: sl<DioHelper>(), firestore: sl<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<FavouriteRepositoryImpl>(
    () => FavouriteRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      favouriteDataSource: sl<FavouriteDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton<GetFavouriteUseCase>(() =>
      GetFavouriteUseCase(favouriteRepository: sl<FavouriteRepositoryImpl>()));
  sl.registerLazySingleton<GetplayersUseCase>(() =>
      GetplayersUseCase(favouriteRepository: sl<FavouriteRepositoryImpl>()));
  sl.registerFactory<FavouriteCubit>(
    () => FavouriteCubit(
        getfavouritesUseCase: sl<GetFavouriteUseCase>(),
        getplayersUseCase: sl<GetplayersUseCase>()),
  );
}
