import 'package:Goal/src/features/team/data/models/player_squad/player_squad.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';

import '../../domain/entities/lineups.dart';
import 'lineup_team_model.dart';

class LineupModel extends Lineup {
  const LineupModel(
      {required super.team,
      required super.coachName,
      required super.coachPhoto,
      required super.coachId,
      required super.formation,
      required super.startXI,
      required super.substitutes});

  factory LineupModel.fromJson(Map<String, dynamic> json) => LineupModel(
        team: LineupTeamModel.fromJson(json["team"]),
        coachName: json["coach"]["name"] ?? "",
        coachPhoto: json["coach"]["photo"] ?? "",
        coachId: json["coach"]["id"] ?? 0,
        formation: json["formation"],
        startXI: List<PlayerSquad>.from(
          json["startXI"]
              .map((player) => PlayerSquadModel.fromJson(player["player"])),
        ),
        substitutes: List<PlayerSquad>.from(
          json["substitutes"]
              .map((player) => PlayerSquadModel.fromJson(player["player"])),
        ),
      );
}
