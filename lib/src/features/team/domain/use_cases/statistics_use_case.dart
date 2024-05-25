import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class StatisticsUseCase extends UseCase<TeamStatistics, StatisticsParams> {
  final TeamRepository teamRepository;

  StatisticsUseCase({required this.teamRepository});

  @override
  Future<Either<Failure, TeamStatistics>> call(StatisticsParams params) async {
    return await teamRepository.getStatistics(params: params);
  }
}

class StatisticsParams extends Equatable {
  final String leagueId;
  final String season;
  final String teamId;

  const StatisticsParams(
      {required this.teamId, required this.leagueId, required this.season});

  @override
  List<Object?> get props => [leagueId, season, teamId];

  Map<String, dynamic> toJson() =>
      {"league": leagueId, "season": season, "team": teamId};
}
