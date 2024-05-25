import 'package:Goal/src/core/domain/mappers/mappers.dart';
import 'package:Goal/src/core/models/teams_model.dart';
import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/statistcs_info.dart';
import 'package:Goal/src/features/player/domain/mappers/mappers.dart';

class StatisticsInfoModel extends StatisticsInfo {
  const StatisticsInfoModel(
      {required super.team,
      required super.league,
      required super.games,
      required super.substitutes,
      required super.shots,
      required super.goals,
      required super.passes,
      required super.tackles,
      required super.duels,
      required super.dribbles,
      required super.fouls,
      required super.cards,
      required super.penalty});
  factory StatisticsInfoModel.fromJson(Map<String, dynamic> json) {
    return StatisticsInfoModel(
      team: TeamModel.fromJson(json['team']).toDomain(),
      league: PlayerLeagueModel.fromJson(json['league']).toDomain(),
      games: GamesModel.fromJson(json['games']).toDomain(),
      substitutes: SubstitutesModel.fromJson(json['substitutes']).toDomain(),
      shots: ShotsModel.fromJson(json['shots']).toDomain(),
      goals: GoalsModel.fromJson(json['goals']).toDomain(),
      passes: PassesModel.fromJson(json['passes']).toDomain(),
      tackles: TacklesModel.fromJson(json['tackles']).toDomain(),
      duels: DuelsModel.fromJson(json['duels']).toDomain(),
      dribbles: DribblesModel.fromJson(json['dribbles']).toDomain(),
      fouls: FoulsModel.fromJson(json['fouls']).toDomain(),
      cards: CardsModel.fromJson(json['cards']).toDomain(),
      penalty: PenaltyModel.fromJson(json['penalty']).toDomain(),
    );
  }
}

class PlayerLeagueModel extends Leagueinfo {
  const PlayerLeagueModel(
      {required super.id,
      required super.name,
      required super.type,
      required super.logo});

  factory PlayerLeagueModel.fromJson(Map<String, dynamic> json) {
    return PlayerLeagueModel(
        id: json["id"] ?? 0,
        name: json["name"],
        logo: json["logo"] ?? "",
        type: "League");
  }
}

class GamesModel extends Games {
  const GamesModel({
    required super.appearences,
    required super.lineups,
    required super.minutes,
    required super.position,
    required super.rating,
  });

  factory GamesModel.fromJson(Map<String, dynamic> json) {
    return GamesModel(
      appearences: json['appearences'] ?? 0,
      lineups: json['lineups'] ?? 0,
      minutes: json['minutes'] ?? 0,
      position: json['position'] ?? "",
      rating: json['rating'] ?? "",
    );
  }
}

class SubstitutesModel extends Substitutes {
  const SubstitutesModel({
    required super.play,
    required super.out,
    required super.bench,
  });
  factory SubstitutesModel.fromJson(Map<String, dynamic> json) {
    return SubstitutesModel(
      play: json['in'] ?? 0,
      out: json['out'] ?? 0,
      bench: json['bench'] ?? 0,
    );
  }
}

class ShotsModel extends Shots {
  const ShotsModel({
    required super.total,
    required super.on,
  });
  factory ShotsModel.fromJson(Map<String, dynamic> json) {
    return ShotsModel(
      total: json['total'] ?? 0,
      on: json['on'] ?? 0,
    );
  }
}

class GoalsModel extends Goals {
  const GoalsModel({
    required super.total,
    required super.assists,
    required super.saves,
  });
  factory GoalsModel.fromJson(Map<String, dynamic> json) {
    return GoalsModel(
      total: json['total'] ?? 0,
      assists: json['assists'] ?? 0,
      saves: json['saves'] ?? 0,
    );
  }
}

class PassesModel extends Passes {
  const PassesModel({
    required super.total,
    required super.key,
    required super.accuracy,
  });
  factory PassesModel.fromJson(Map<String, dynamic> json) {
    return PassesModel(
      total: json['total'] ?? 0,
      key: json['key'] ?? 0,
      accuracy: json['accuracy'] ?? 0,
    );
  }
}

class PassModel extends Pass {
  const PassModel({
    required super.total,
    required super.key,
    required super.accuracy,
  });
  factory PassModel.fromJson(Map<String, dynamic> json) {
    return PassModel(
      total: json['total'] ?? 0,
      key: json['key'] ?? 0,
      accuracy: json['accuracy'] ?? "0",
    );
  }
}

class TacklesModel extends Tackles {
  const TacklesModel({
    required super.total,
    required super.blocks,
    required super.interceptions,
  });
  factory TacklesModel.fromJson(Map<String, dynamic> json) {
    return TacklesModel(
      total: json['total'] ?? 0,
      blocks: json['blocks'] ?? 0,
      interceptions: json['interceptions'] ?? 0,
    );
  }
}

class DuelsModel extends Duels {
  const DuelsModel({
    required super.total,
    required super.won,
  });
  factory DuelsModel.fromJson(Map<String, dynamic> json) {
    return DuelsModel(
      total: json['total'] ?? 0,
      won: json['won'] ?? 0,
    );
  }
}

class DribblesModel extends Dribbles {
  const DribblesModel({
    required super.attempts,
    required super.success,
  });
  factory DribblesModel.fromJson(Map<String, dynamic> json) {
    return DribblesModel(
      attempts: json['attempts'] ?? 0,
      success: json['success'] ?? 0,
    );
  }
}

class FoulsModel extends Fouls {
  const FoulsModel({
    required super.drawn,
    required super.committed,
  });
  factory FoulsModel.fromJson(Map<String, dynamic> json) {
    return FoulsModel(
      drawn: json['drawn'] ?? 0,
      committed: json['committed'] ?? 0,
    );
  }
}

class CardsModel extends Cards {
  const CardsModel({
    required super.yellow,
    required super.yellowred,
    required super.red,
  });
  factory CardsModel.fromJson(Map<String, dynamic> json) {
    return CardsModel(
      yellow: json['yellow'] ?? 0,
      yellowred: json['yellowred'] ?? 0,
      red: json['red'] ?? 0,
    );
  }
}

class PenaltyModel extends Penalty {
  const PenaltyModel({
    required super.won,
    required super.commited,
    required super.missed,
    required super.saved,
    required super.scored,
  });
  factory PenaltyModel.fromJson(Map<String, dynamic> json) {
    return PenaltyModel(
      won: json['won'] ?? 0,
      commited: json['commited'] ?? 0,
      missed: json['missed'] ?? 0,
      saved: json['saved'] ?? 0,
      scored: json['scored'] ?? 0,
    );
  }
}
