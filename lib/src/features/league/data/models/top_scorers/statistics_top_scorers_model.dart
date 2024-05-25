import 'package:Goal/src/core/domain/mappers/mappers.dart';
import 'package:Goal/src/core/models/teams_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/goals_top_scorers_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/penalty_top_scorers_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/red_card_top_scorers_model.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/statistics_top_scorers.dart';
import 'package:Goal/src/features/league/domain/mappers/mappers.dart';

class StatisticsTopScorersModel extends StatisticsTopScorers {
  const StatisticsTopScorersModel(
      {required super.goals,
      required super.penalty,
      required super.team,
      required super.cards});

  factory StatisticsTopScorersModel.fromJson(Map<String, dynamic> json) {
    return StatisticsTopScorersModel(
      goals: GoalsTopScorerModel.fromJson(json['goals']).toDomain(),
      penalty: PenaltyTopScorersModel.fromJson(json['penalty']).toDomain(),
      team: TeamModel.fromJson(json['team']).toDomain(),
      cards: RedCardModel.fromJson(json['cards']).toDomain(),
    );
  }
}
