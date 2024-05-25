import 'package:Goal/src/features/player/domain/entities/player_info/statistcs_info.dart';
import 'package:equatable/equatable.dart';

class FixtureStatistics extends Equatable {
  final List<Player> players;

  const FixtureStatistics({
    required this.players,
  });

  @override
  List<Object?> get props => [players];
}

class Player extends Equatable {
  final PlayerDetails player;
  final List<PlayerStatistics> statistics;

  const Player({
    required this.player,
    required this.statistics,
  });

  @override
  List<Object?> get props => [player, statistics];
}

class PlayerDetails extends Equatable {
  final int id;
  final String name;
  final String photo;

  const PlayerDetails({
    required this.id,
    required this.name,
    required this.photo,
  });

  @override
  List<Object?> get props => [id, name, photo];
}

class PlayerStatistics extends Equatable {
  final Games games;
  final Shots shots;
  final Goals goals;
  final Pass passes;
  final Tackles tackles;
  final Duels duels;
  final Dribbles dribbles;
  final Fouls fouls;
  final Cards cards;
  final Penalty penalty;

  const PlayerStatistics({
    required this.games,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  @override
  List<Object?> get props => [
        games,
        shots,
        goals,
        passes,
        tackles,
        duels,
        dribbles,
        fouls,
        cards,
        penalty
      ];
}
