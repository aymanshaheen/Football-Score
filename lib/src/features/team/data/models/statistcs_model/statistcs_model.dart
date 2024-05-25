import 'package:Goal/src/features/team/data/models/statistcs_model/biggest_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/clean_sheet_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/fixtures_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/league_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/lineup_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/statistcs_goals_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/team_model.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/lineup.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';
import 'package:Goal/src/features/team/domain/mappers/mappers.dart';

class TeamStatisticsModel extends TeamStatistics {
  const TeamStatisticsModel({
    required super.biggest,
    required super.cleanSheet,
    required super.failedToScore,
    required super.fixtures,
    required super.form,
    required super.goals,
    required super.league,
    required super.lineups,
    required super.team,
  });

  factory TeamStatisticsModel.fromJson(Map<String, dynamic> json) {
    return TeamStatisticsModel(
      biggest: json["biggest"] == null
          ? null
          : BiggestModel.fromJson(json["biggest"]).toDomain(),
      cleanSheet: json["clean_sheet"] == null
          ? null
          : CleanSheetModel.fromJson(json["clean_sheet"]).toDomain(),
      failedToScore: json["failed_to_score"] == null
          ? null
          : CleanSheetModel.fromJson(json["failed_to_score"]).toDomain(),
      fixtures: json["fixtures"] == null
          ? null
          : FixturesModel.fromJson(json["fixtures"]).toDomain(),
      form: json["form"] ?? '',
      goals: json["goals"] == null
          ? null
          : StatisticsModelGoalsModel.fromJson(json["goals"]).toDomain(),
      league: json["league"] == null
          ? null
          : LeaguesModel.fromJson(json["league"]).toDomain(),
      lineups: json["lineups"] == null
          ? []
          : List<Lineups>.from(
              json["lineups"]!.map((x) => LineupsModel.fromJson(x).toDomain())),
      team: json["team"] == null ? null : TeamstModel.fromJson(json["team"]),
    );
  }
}
