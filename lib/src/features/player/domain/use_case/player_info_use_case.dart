import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/domain/repositories/player_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class PlayerInfoUseCase extends UseCase<PlayerStatsInfo, PlayerParams> {
  final PlayerRepository playerRepository;

  PlayerInfoUseCase({required this.playerRepository});

  @override
  Future<Either<Failure, PlayerStatsInfo>> call(PlayerParams params) async {
    return await playerRepository.getPlayerInfo(params: params);
  }
}

class PlayerParams extends Equatable {
  final String playerId;
  final String season;

  const PlayerParams({required this.playerId, required this.season});

  @override
  List<Object?> get props => [season, playerId];

  Map<String, dynamic> toJson() => {"season": season, "id": playerId};
}
