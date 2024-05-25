import 'package:Goal/src/features/team/data/models/statistcs_model/for_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/fulffy_model.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics_goals.dart';
import 'package:Goal/src/features/team/domain/mappers/mappers.dart';

class StatisticsModelGoalsModel extends StatisticsGoals {
  const StatisticsModelGoalsModel({
    required super.against,
    required super.goalsFor,
  });

  factory StatisticsModelGoalsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModelGoalsModel(
      against: json["against"] == null
          ? null
          : FluffyAgainstModel.fromJson(json["against"]).toDomain(),
      goalsFor: json["for"] == null
          ? null
          : ForModel.fromJson(json["for"]).toDomain(),
    );
  }
}
