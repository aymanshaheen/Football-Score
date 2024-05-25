import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:dartz/dartz.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class PlayerSquadUseCase extends UseCase<TeamSquad, int> {
  final TeamRepository teamRepository;

  PlayerSquadUseCase({required this.teamRepository});

  @override
  Future<Either<Failure, TeamSquad>> call(int teamId) async {
    return await teamRepository.getPlayerSquad(teamId: teamId);
  }
}
