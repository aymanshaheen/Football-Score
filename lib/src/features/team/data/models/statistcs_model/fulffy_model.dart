import 'package:Goal/src/features/team/data/models/statistcs_model/average_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/clean_sheet_model.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/fulffy_goal.dart';
import 'package:Goal/src/features/team/domain/mappers/mappers.dart';

class FluffyAgainstModel extends FluffyAgainst {
  const FluffyAgainstModel({
    required super.average,
    required super.total,
  });

  factory FluffyAgainstModel.fromJson(Map<String, dynamic> json) {
    return FluffyAgainstModel(
      average: json["average"] == null
          ? null
          : AverageModel.fromJson(json["average"]).toDomain(),
      total: json["total"] == null
          ? null
          : CleanSheetModel.fromJson(json["total"]).toDomain(),
    );
  }
}
