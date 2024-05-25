import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';
import 'package:equatable/equatable.dart';
import 'lineup_team.dart';

class Lineup extends Equatable {
  final LineupTeam team;
  final String coachName;
  final String coachPhoto;
  final int coachId;
  final String formation;
  final List<PlayerSquad> startXI;
  final List<PlayerSquad> substitutes;

  const Lineup({
    required this.team,
    required this.coachName,
    required this.coachPhoto,
    required this.coachId,
    required this.formation,
    required this.startXI,
    required this.substitutes,
  });

  @override
  List<Object?> get props =>
      [team, coachName, formation, startXI, substitutes, coachPhoto, coachId];
}
