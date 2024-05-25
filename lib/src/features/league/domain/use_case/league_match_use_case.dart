import 'package:Goal/src/features/league/data/repositories/league_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class LeagueMatchesUseCase
    extends UseCase<List<SoccerFixture>, LeagueMatchesParameter> {
  final LeagueRepositoryImpl leagueRepository;

  LeagueMatchesUseCase({required this.leagueRepository});

  @override
  Future<Either<Failure, List<SoccerFixture>>> call(
      LeagueMatchesParameter params) async {
    return await leagueRepository.getLeagueMatches(params: params);
  }
}

class LeagueMatchesParameter extends Equatable {
  final String season;
  final String? leagueId;

  const LeagueMatchesParameter({this.leagueId, required this.season});

  @override
  List<Object?> get props => [season, leagueId];

  Map<String, dynamic> toJson() => {
        "season": season,
        "league": leagueId,
      };
}
