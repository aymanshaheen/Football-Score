import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/repositories/league_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class TopScorersUseCase
    implements UseCase<List<PlayerTopScorers>, ScorersParams> {
  final LeagueRepository leagueRepository;

  TopScorersUseCase({required this.leagueRepository});

  @override
  Future<Either<Failure, List<PlayerTopScorers>>> call(
      ScorersParams league) async {
    return await leagueRepository.getTopScorers(league: league);
  }
}

class ScorersParams extends Equatable {
  final int leagueId;
  final int season;

  const ScorersParams({required this.leagueId, required this.season});

  @override
  List<Object?> get props => [season, leagueId];

  Map<String, dynamic> toJson() => {"season": season, "league": leagueId};
}
