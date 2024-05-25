import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/mappers/mappers.dart';
import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/core/error/response_status.dart';
import 'package:Goal/src/core/network/network_info.dart';
import 'package:Goal/src/features/league/data/datasources/league_data_source.dart';
import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/mappers/mappers.dart';
import 'package:Goal/src/features/league/domain/repositories/league_repository.dart';
import 'package:Goal/src/features/league/domain/use_case/league_match_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_asistis_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_red_card_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_scorers_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_yellow_card_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LeagueRepositoryImpl implements LeagueRepository {
  final LeagueDataSource leagueDataSource;
  final NetworkInfo networkInfo;

  LeagueRepositoryImpl({
    required this.leagueDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PlayerTopScorers>>> getTopScorers(
      {required ScorersParams league}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await leagueDataSource.getTopScorers(league: league);
        List<PlayerTopScorers> fixtures =
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
  Future<Either<Failure, List<PlayerTopScorers>>> geatTopAsistis(
      {required AsistsParams league}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await leagueDataSource.getTopAsistis(league: league);
        List<PlayerTopScorers> fixtures =
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
  Future<Either<Failure, List<PlayerTopScorers>>> getRedCards(
      {required RedParams league}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await leagueDataSource.getRedCards(league: league);
        List<PlayerTopScorers> fixtures =
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
  Future<Either<Failure, List<PlayerTopScorers>>> getYellowCards(
      {required YellowParams league}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await leagueDataSource.getYellowCards(league: league);
        List<PlayerTopScorers> fixtures =
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
  Future<Either<Failure, LeagueInfo>> getLeagueInfo(
      {required int league}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await leagueDataSource.getLeagueInfo(league: league);
        LeagueInfo leagueInfo = result;
        return Right(leagueInfo);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<SoccerFixture>>> getLeagueMatches(
      {required LeagueMatchesParameter params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await leagueDataSource.getLeagueMatches(params: params);
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
}
