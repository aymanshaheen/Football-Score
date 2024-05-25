import 'package:Goal/src/features/league/data/models/league_info/league_info_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/goals_top_scorers_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/league_top_scorers_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/penalty_top_scorers_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/red_card_top_scorers_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/statistics_top_scorers_model.dart';
import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/goals_top_scorers.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/penalty_top_scorers.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/red_card.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/statistics_top_scorers.dart';

extension LeagueTopScorersExtension on PlayerTopScorersModel {
  PlayerTopScorers toDomain() => PlayerTopScorers(
        id: id,
        name: name,
        statistics: statistics,
        photo: photo,
      );
}

extension StatisticsTopScorersExtinsion on StatisticsTopScorersModel {
  StatisticsTopScorers toDomain() => StatisticsTopScorers(
        goals: goals,
        penalty: penalty,
        team: team,
        cards: cards,
      );
}

extension GoalsTopScorersExtinsion on GoalsTopScorerModel {
  GoalsTopScorers toDomain() => GoalsTopScorers(
        total: total,
        assists: assists,
      );
}

extension PenaltyTopScorersExtinsion on PenaltyTopScorersModel {
  PenaltyTopScorers toDomain() => PenaltyTopScorers(
        scored: scored,
      );
}

extension RedCardExtinsion on RedCardModel {
  RedCardTopScorers toDomain() =>
      RedCardTopScorers(red: red, yellow: yellow, yellowred: yellowred);
}

extension LeagueInfoExtinsion on LeagueModel {
  Leagueinfo toDomain() =>
      Leagueinfo(id: id, name: name, type: type, logo: logo);
}

extension CountryExtinsion on CountryModel {
  Country toDomain() => Country(name: name, code: code, flag: flag);
}
