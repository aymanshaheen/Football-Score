import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/mappers/mappers.dart';
import 'package:Goal/src/features/team/data/datasources/team_data_source.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import 'package:Goal/src/features/team/domain/use_cases/last_matches_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/next_match_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/statistics_use_case.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/response_status.dart';
import '../../../../core/network/network_info.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamDataSource teamDataSource;
  final NetworkInfo networkInfo;

  TeamRepositoryImpl({
    required this.teamDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<SoccerFixture>>> getLastMatches(
      {required LastMatchesParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await teamDataSource.getLastMatches(params: params);
        List<SoccerFixture> fixtures =
            result.map((fixture) => fixture.toDomain()).toList();
        return Right(fixtures);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<SoccerFixture>>> getNextMatches(
      {required NextMatchesParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await teamDataSource.getNextMatches(params: params);
        List<SoccerFixture> fixtures =
            result.map((fixture) => fixture.toDomain()).toList();
        return Right(fixtures);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, TeamStatistics>> getStatistics(
      {required StatisticsParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await teamDataSource.getStatistics(params: params);
        TeamStatistics standings = result;
        return Right(standings);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveFavorite(
      {required String id, required String name, required String photo}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await teamDataSource.saveFavorite(id, photo, name);
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
        final result = await teamDataSource.deleteFavorite(id);
        return Right(result);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, TeamSquad>> getPlayerSquad(
      {required int teamId}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await teamDataSource.getPlayerSquad(teamId: teamId);
        TeamSquad playerSquads = result;
        return Right(playerSquads);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }
}
