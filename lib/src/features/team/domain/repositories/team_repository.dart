import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:dartz/dartz.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/domain/use_cases/last_matches_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/next_match_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/statistics_use_case.dart';

abstract class TeamRepository {
  Future<Either<Failure, TeamStatistics>> getStatistics(
      {required StatisticsParams params});
  Future<Either<Failure, List<SoccerFixture>>> getLastMatches(
      {required LastMatchesParams params});
  Future<Either<Failure, List<SoccerFixture>>> getNextMatches(
      {required NextMatchesParams params});
  Future<Either<Failure, void>> deleteFavorite({required String id});
  Future<Either<Failure, void>> saveFavorite(
      {required String id, required String photo, required String name});
  Future<Either<Failure, TeamSquad>> getPlayerSquad({required int teamId});
}
