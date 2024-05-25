import 'package:Goal/src/features/fixture/domain/entities/player_statistics.dart';
import 'package:Goal/src/features/player/data/models/player_statistics/statistics_info_model.dart';

class FixturesStatisticsModel extends FixtureStatistics {
  const FixturesStatisticsModel({
    required super.players,
  });

  factory FixturesStatisticsModel.fromJson(Map<String, dynamic> json) {
    return FixturesStatisticsModel(
      players: (json['players'] as List)
          .map((i) => PlayerModel.fromJson(i))
          .toList(),
    );
  }
}

class PlayerModel extends Player {
  const PlayerModel({
    required super.player,
    required super.statistics,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      player: PlayerDetailsModel.fromJson(json['player']),
      statistics: (json['statistics'] as List)
          .map((i) => PlayerStatisticsModel.fromJson(i))
          .toList(),
    );
  }
}

class PlayerDetailsModel extends PlayerDetails {
  const PlayerDetailsModel({
    required super.id,
    required super.name,
    required super.photo,
  });

  factory PlayerDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlayerDetailsModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}

class PlayerStatisticsModel extends PlayerStatistics {
  const PlayerStatisticsModel({
    required super.games,
    required super.shots,
    required super.goals,
    required super.passes,
    required super.tackles,
    required super.duels,
    required super.dribbles,
    required super.fouls,
    required super.cards,
    required super.penalty,
  });

  factory PlayerStatisticsModel.fromJson(Map<String, dynamic> json) {
    return PlayerStatisticsModel(
      games: GamesModel.fromJson(json['games']),
      shots: ShotsModel.fromJson(json['shots']),
      goals: GoalsModel.fromJson(json['goals']),
      passes: PassModel.fromJson(json['passes']),
      tackles: TacklesModel.fromJson(json['tackles']),
      duels: DuelsModel.fromJson(json['duels']),
      dribbles: DribblesModel.fromJson(json['dribbles']),
      fouls: FoulsModel.fromJson(json['fouls']),
      cards: CardsModel.fromJson(json['cards']),
      penalty: PenaltyModel.fromJson(json['penalty']),
    );
  }
}
