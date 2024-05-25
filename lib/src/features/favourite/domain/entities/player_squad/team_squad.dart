import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';
import 'package:equatable/equatable.dart';

class TeamSquad extends Equatable {
  final Team team;
  final List<PlayerSquad> playerSquad;

  const TeamSquad({
    required this.playerSquad,
    required this.team,
  });

  @override
  List<Object?> get props => [playerSquad, team];
}
