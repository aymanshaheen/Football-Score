import 'package:Goal/src/features/player/data/models/player_statistics/player_info_model.dart';
import 'package:Goal/src/features/player/data/models/player_statistics/statistics_info_model.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/statistcs_info.dart';
import 'package:Goal/src/features/player/domain/mappers/mappers.dart';

class PlayerStatsModelInfo extends PlayerStatsInfo {
  const PlayerStatsModelInfo({
    required super.playerInfo,
    required super.statisticsInfo,
  });

  factory PlayerStatsModelInfo.fromJson(Map<String, dynamic> json) {
    return PlayerStatsModelInfo(
        playerInfo: json["player"] == null
            ? null
            : PlayerInfModel.fromJson(json["player"]).toDomain(),
        statisticsInfo: json["statistics"] == null
            ? []
            : List<StatisticsInfo>.from(json["statistics"]
                .map((x) => StatisticsInfoModel.fromJson(x))));
  }
}
