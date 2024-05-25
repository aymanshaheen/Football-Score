import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/use_case/league_match_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_asistis_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_red_card_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_scorers_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_yellow_card_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class LeagueRepository {
  Future<Either<Failure, List<PlayerTopScorers>>> getTopScorers({
    required ScorersParams league,
  });
  Future<Either<Failure, List<PlayerTopScorers>>> geatTopAsistis({
    required AsistsParams league,
  });
  Future<Either<Failure, List<PlayerTopScorers>>> getRedCards({
    required RedParams league,
  });
  Future<Either<Failure, List<PlayerTopScorers>>> getYellowCards({
    required YellowParams league,
  });
  Future<Either<Failure, LeagueInfo>> getLeagueInfo({
    required int league,
  });
  Future<Either<Failure, List<SoccerFixture>>> getLeagueMatches(
      {required LeagueMatchesParameter params});
}
