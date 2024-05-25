import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/player/data/models/player_statistics/player_info_model.dart';
import 'package:Goal/src/features/player/data/models/player_statistics/statistics_info_model.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/player_info.dart';
import 'package:Goal/src/features/player/domain/entities/player_info/statistcs_info.dart';

extension PlayerInfoExtension on PlayerInfModel {
  PlayerInfo toDomain() => PlayerInfo(
      id: id,
      name: name,
      firstname: firstname,
      lastname: lastname,
      age: age,
      birth: birth,
      nationality: nationality,
      height: height,
      weight: weight,
      injured: injured,
      photo: photo);
}

extension BirthExtension on BirthModel {
  Birth toDomain() => Birth(date: date, place: place, country: country);
}

extension StatisticsInfoModelExtension on StatisticsInfoModel {
  StatisticsInfo toDomain() => StatisticsInfo(
      duels: duels,
      team: team,
      league: league,
      games: games,
      substitutes: substitutes,
      shots: shots,
      goals: goals,
      passes: passes,
      tackles: tackles,
      dribbles: dribbles,
      fouls: fouls,
      cards: cards,
      penalty: penalty);
}

extension LeagueExtension on PlayerLeagueModel {
  Leagueinfo toDomain() =>
      Leagueinfo(id: id, name: name, type: type, logo: logo);
}

extension GamesModelExtension on GamesModel {
  Games toDomain() => Games(
      appearences: appearences,
      lineups: lineups,
      minutes: minutes,
      position: position,
      rating: rating);
}

extension SubstitutesModelExtension on SubstitutesModel {
  Substitutes toDomain() => Substitutes(out: out, bench: bench, play: play);
}

extension ShotsModelExtinsion on ShotsModel {
  Shots toDomain() => Shots(on: on, total: total);
}

extension GoalsModelExtinsion on GoalsModel {
  Goals toDomain() => Goals(total: total, assists: assists, saves: saves);
}

extension PassesModelExtinsion on PassesModel {
  Passes toDomain() => Passes(total: total, key: key, accuracy: accuracy);
}

extension TacklesModelExtinsion on TacklesModel {
  Tackles toDomain() =>
      Tackles(total: total, blocks: blocks, interceptions: interceptions);
}

extension DuelsModelExtinsion on DuelsModel {
  Duels toDomain() => Duels(total: total, won: won);
}

extension DribblesModelExtinsion on DribblesModel {
  Dribbles toDomain() => Dribbles(attempts: attempts, success: success);
}

extension FoulsModelExtinsion on FoulsModel {
  Fouls toDomain() => Fouls(drawn: drawn, committed: committed);
}

extension CardsModelExtinsion on CardsModel {
  Cards toDomain() => Cards(yellow: yellow, yellowred: yellowred, red: red);
}

extension PenaltyModelExtinsion on PenaltyModel {
  Penalty toDomain() => Penalty(
      won: won,
      commited: commited,
      scored: scored,
      missed: missed,
      saved: saved);
}
