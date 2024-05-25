import 'package:Goal/src/features/team/data/models/statistcs_model/clean_sheet_model.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/fixtures.dart';
import 'package:Goal/src/features/team/domain/mappers/mappers.dart';

class FixturesModel extends Fixtures {
  const FixturesModel({
    required super.draws,
    required super.loses,
    required super.played,
    required super.wins,
  });

  factory FixturesModel.fromJson(Map<String, dynamic> json) {
    return FixturesModel(
      draws: json["draws"] == null
          ? null
          : CleanSheetModel.fromJson(json["draws"]).toDomain(),
      loses: json["loses"] == null
          ? null
          : CleanSheetModel.fromJson(json["loses"]).toDomain(),
      played: json["played"] == null
          ? null
          : CleanSheetModel.fromJson(json["played"]).toDomain(),
      wins: json["wins"] == null
          ? null
          : CleanSheetModel.fromJson(json["wins"]).toDomain(),
    );
  }
}
