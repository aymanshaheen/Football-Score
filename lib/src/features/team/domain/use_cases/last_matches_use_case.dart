import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class LastMatchesUseCase
    extends UseCase<List<SoccerFixture>, LastMatchesParams> {
  final TeamRepository teamRepository;

  LastMatchesUseCase({required this.teamRepository});

  @override
  Future<Either<Failure, List<SoccerFixture>>> call(
      LastMatchesParams params) async {
    return await teamRepository.getLastMatches(params: params);
  }
}

class LastMatchesParams extends Equatable {
  final String season;
  final String? teamId;
  final int last;

  const LastMatchesParams(
      {required this.last, this.teamId, required this.season});

  @override
  List<Object?> get props => [season, teamId, last];

  Map<String, dynamic> toJson() =>
      {"season": season, "team": teamId, "last": last};
}
