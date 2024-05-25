import 'package:Goal/src/features/player/domain/entities/player_info/player_info.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/statistcs_info.dart';
import 'package:equatable/equatable.dart';

class PlayerStatsInfo extends Equatable {
  final PlayerInfo? playerInfo;
  final List<StatisticsInfo> statisticsInfo;

  const PlayerStatsInfo({
    required this.playerInfo,
    required this.statisticsInfo,
  });

  @override
  List<Object?> get props => [playerInfo, statisticsInfo];
}
