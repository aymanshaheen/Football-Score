import '../../data/models/event_model.dart';
import '../../data/models/lineup_team_model.dart';
import '../../data/models/lineups_model.dart';
import '../../data/models/player_model.dart';
import '../../data/models/statistics_model.dart';
import '../entities/events.dart';
import '../entities/lineup_team.dart';
import '../entities/lineups.dart';
import '../entities/player.dart';
import '../entities/statistics.dart';

extension StatisticExtension on StatisticModel {
  Statistic toDomain() => Statistic(type: type, value: value);
}

extension StatisticsExtension on StatisticsModel {
  Statistics toDomain() => Statistics(team: team, statistics: statistics);
}

extension PlayerExtension on PlayerLiModel {
  PlayerLi toDomain() =>
      PlayerLi(id: id, name: name, number: number, grid: grid, pos: pos);
}

extension LineupTeamExtension on LineupTeamModel {
  LineupTeam toDomain() =>
      LineupTeam(id: id, name: name, logo: logo, colors: colors);
}

extension PlayerColorsExtension on PlayerColorsModel {
  PlayerColors toDomain() =>
      PlayerColors(primary: primary, number: number, border: border);
}

extension LineupExtension on LineupModel {
  Lineup toDomain() => Lineup(
        team: team,
        coachName: coachName,
        coachPhoto: coachPhoto,
        coachId: coachId,
        formation: formation,
        startXI: startXI,
        substitutes: substitutes,
      );
}

extension EventExtension on EventModel {
  Event toDomain() => Event(
        time: time,
        comment: comment,
        team: team,
        playerName: playerName,
        assistName: assistName,
        type: type,
        detail: detail,
      );
}

extension LineupColorsExtension on LineupColorsModel {
  LineupColors toDomain() =>
      LineupColors(player: player, goalKeeper: goalKeeper);
}
