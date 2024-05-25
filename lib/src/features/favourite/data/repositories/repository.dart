import 'package:Goal/src/features/favourite/data/datasources/data_source.dart';
import 'package:Goal/src/features/favourite/domain/repositories/repository.dart';
import 'package:Goal/src/features/team/domain/entities/favourite.dart';
import '../../../../core/network/network_info.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final FavouriteDataSource favouriteDataSource;
  final NetworkInfo networkInfo;

  FavouriteRepositoryImpl({
    required this.favouriteDataSource,
    required this.networkInfo,
  });

  @override
  Stream<List<Favourite>> getFavourite() {
    return favouriteDataSource.getFavourite();
  }  
  @override
  Stream<List<Favourite>> getPlayers() {
    return favouriteDataSource.getPlayers();
  }
}
