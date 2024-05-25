import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/domain/use_case/player_info_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class PlayerRepository {
  Future<Either<Failure, PlayerStatsInfo>> getPlayerInfo(
      {required PlayerParams params});
      Future<Either<Failure, void>> deleteFavorite({required String id});
  Future<Either<Failure, void>> saveFavorite(
      {required String id, required String photo, required String name});
}
