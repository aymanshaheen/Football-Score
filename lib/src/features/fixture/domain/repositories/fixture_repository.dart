import 'package:Goal/src/features/fixture/domain/entities/h2h.dart';
import 'package:Goal/src/features/fixture/domain/entities/player_statistics.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../entities/events.dart';
import '../entities/lineups.dart';
import '../entities/statistics.dart';

abstract class FixtureRepository {
  Future<Either<Failure, List<Statistics>>> getStatistics(String fixtureId);

  Future<Either<Failure, List<Lineup>>> getLineups(String fixtureId);

  Future<Either<Failure, List<Event>>> getEvents(String fixtureId);
  Future<Either<Failure, List<H2H>>> getH2H(String teams);
  Future<Either<Failure, List<FixtureStatistics>>> getPlayersStatistics(
      String teams);
}
