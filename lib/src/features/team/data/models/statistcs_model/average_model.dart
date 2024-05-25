import 'package:Goal/src/features/team/domain/entities/statistics/average.dart';

class AverageModel extends Average {
  const AverageModel({
    required super.away,
    required super.home,
    required super.total,
  });

  factory AverageModel.fromJson(Map<String, dynamic> json) {
    return AverageModel(
      away: json["away"],
      home: json["home"],
      total: json["total"],
    );
  }
}
