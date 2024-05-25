import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class NextMatchesUseCase
    extends UseCase<List<SoccerFixture>, NextMatchesParams> {
  final TeamRepository teamRepository;

  NextMatchesUseCase({required this.teamRepository});

  @override
  Future<Either<Failure, List<SoccerFixture>>> call(
      NextMatchesParams params) async {
    return await teamRepository.getNextMatches(params: params);
  }
}

class NextMatchesParams extends Equatable {
  final String season;
  final String? teamId;
  final int next;

  const NextMatchesParams(
      {required this.next, this.teamId, required this.season});

  @override
  List<Object?> get props => [season, teamId, next];

  Map<String, dynamic> toJson() =>
      {"season": season, "team": teamId, "next": next};
}
