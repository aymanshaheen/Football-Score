import 'package:Goal/src/features/league/data/models/top_scorers/statistics_top_scorers_model.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/mappers/mappers.dart';

class PlayerTopScorersModel extends PlayerTopScorers {
  const PlayerTopScorersModel(
      {required super.id,
      required super.name,
      required super.statistics,
      required super.photo});

  factory PlayerTopScorersModel.fromJson(Map<String, dynamic> json) {
    return PlayerTopScorersModel(
      id: json['player']['id'],
      name: json['player']['name'],
      photo: json['player']['photo'],
      statistics:
          StatisticsTopScorersModel.fromJson(json['statistics'][0]).toDomain(),
    );
  }
}
