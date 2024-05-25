import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/core/error/response_status.dart';
import 'package:Goal/src/core/network/network_info.dart';
import 'package:Goal/src/features/player/data/datasources/player_data_source.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/domain/repositories/player_repository.dart';
import 'package:Goal/src/features/player/domain/use_case/player_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerDataSource playerDataSource;
  final NetworkInfo networkInfo;

  PlayerRepositoryImpl({
    required this.playerDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> saveFavorite(
      {required String id, required String name, required String photo}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await playerDataSource.saveFavorite(id, photo, name);
        return Right(result);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavorite({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await playerDataSource.deleteFavorite(id);
        return Right(result);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }
  @override
  Future<Either<Failure, PlayerStatsInfo>> getPlayerInfo(
      {required PlayerParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await playerDataSource.getPlayerInfo(params: params);
        PlayerStatsInfo player = result;
        return Right(player);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }
}
