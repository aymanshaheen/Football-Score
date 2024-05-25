import 'package:Goal/src/features/team/data/models/statistcs_model/against_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/for_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/score_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/streak_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/win_model.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/biggest.dart';
import 'package:Goal/src/features/team/domain/mappers/mappers.dart';

class BiggestModel extends Biggest {
  const BiggestModel({
    required super.goals,
    required super.loses,
    required super.streak,
    required super.wins,
  });

  factory BiggestModel.fromJson(Map<String, dynamic> json) {
    return BiggestModel(
      goals: json["goals"] == null
          ? null
          : BiggestGoalsModel.fromJson(json["goals"]).toDomain(),
      loses: json["loses"] == null
          ? null
          : LosesModel.fromJson(json["loses"]).toDomain(),
      streak: json["streak"] == null
          ? null
          : StreakModel.fromJson(json["streak"]).toDomain(),
      wins: json["wins"] == null
          ? null
          : WinModel.fromJson(json["wins"]).toDomain(),
    );
  }
}

class BiggestGoalsModel extends BiggestGoals {
  const BiggestGoalsModel({
    required super.against,
    required super.goalsFor,
  });

  factory BiggestGoalsModel.fromJson(Map<String, dynamic> json) {
    return BiggestGoalsModel(
      against: json["against"] == null
          ? null
          : AgainstModel.fromJson(json["against"]).toDomain(),
      goalsFor: json["for"] == null
          ? null
          : ForModel.fromJson(json["for"]).toDomain(),
    );
  }
}
