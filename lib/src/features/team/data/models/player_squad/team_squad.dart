import 'package:Goal/src/core/domain/mappers/mappers.dart';
import 'package:Goal/src/core/models/teams_model.dart';
import 'package:Goal/src/features/team/data/models/player_squad/player_squad.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:Goal/src/features/team/domain/mappers/mappers.dart';

class TeamSquadModel extends TeamSquad {
  const TeamSquadModel({
    required super.playerSquad,
    required super.team,
  });

  factory TeamSquadModel.fromJson(Map<String, dynamic> json) {
    return TeamSquadModel(
      team: TeamModel.fromJson(json['team']).toDomain(),
      playerSquad: (json['players'] as List)
          .map((i) => PlayerSquadModel.fromJson(i).toDomain())
          .toList(),
    );
  }
}
