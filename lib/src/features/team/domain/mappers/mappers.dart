import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/features/team/data/models/player_squad/player_squad.dart';
import 'package:Goal/src/features/team/data/models/player_squad/team_squad.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/against_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/average_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/biggest_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/clean_sheet_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/fixtures_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/for_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/fulffy_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/league_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/lineup_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/score_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/statistcs_goals_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/streak_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/team_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/win_model.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/against.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/average.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/biggest.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/clean_sheet.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/fixtures.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/for.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/fulffy_goal.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/league.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/lineup.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/loses.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics_goals.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/streak.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/win.dart';

extension BiggestExtension on BiggestModel {
  Biggest toDomain() {
    return Biggest(
      goals: goals,
      loses: loses,
      streak: streak,
      wins: wins,
    );
  }
}

extension BiggestGoalsModelExtension on BiggestGoalsModel {
  BiggestGoals toDomain() {
    return BiggestGoals(
      against: against,
      goalsFor: goalsFor,
    );
  }
}

extension LosesModelExtension on LosesModel {
  Loses toDomain() {
    return Loses(
      away: away,
      home: home,
    );
  }
}

extension StreakModelExtension on StreakModel {
  Streak toDomain() {
    return Streak(
      draws: draws,
      loses: loses,
      wins: wins,
    );
  }
}

extension WinModelExtension on WinModel {
  Win toDomain() {
    return Win(
      away: away,
      home: home,
    );
  }
}

extension AgainstModelExtension on AgainstModel {
  Against toDomain() {
    return Against(
      away: away,
      home: home,
    );
  }
}

extension ForModelExtension on ForModel {
  For toDomain() {
    return For(
      away: away,
      home: home,
    );
  }
}

extension CleanSheetModelExtension on CleanSheetModel {
  CleanSheet toDomain() {
    return CleanSheet(
      away: away,
      home: home,
      total: total,
    );
  }
}

extension AverageModelExtension on AverageModel {
  Average toDomain() {
    return Average(
      away: away,
      home: home,
      total: total,
    );
  }
}

extension FluffyAgainstModelExtension on FluffyAgainstModel {
  FluffyAgainst toDomain() {
    return FluffyAgainst(
      average: average,
      total: total,
    );
  }
}

extension FixturesModelExtension on FixturesModel {
  Fixtures toDomain() {
    return Fixtures(
      draws: draws,
      loses: loses,
      played: played,
      wins: wins,
    );
  }
}

extension StatisticsModelGoalsModelExtension on StatisticsModelGoalsModel {
  StatisticsGoals toDomain() {
    return StatisticsGoals(
      against: against,
      goalsFor: goalsFor,
    );
  }
}

extension LeagueModelExtension on LeaguesModel {
  Leagues toDomain() {
    return Leagues(
      country: country,
      flag: flag,
      id: id,
      logo: logo,
      name: name,
      season: season,
    );
  }
}

extension LineupModelExtension on LineupsModel {
  Lineups toDomain() {
    return Lineups(
      formation: formation,
      played: played,
    );
  }
}

extension TeamModelExtension on TeamstModel {
  Team toDomain() {
    return Team(
      id: id,
      logo: logo,
      name: name,
    );
  }
}

extension PlayerSquadModelExtension on PlayerSquadModel {
  PlayerSquad toDomain() {
    return PlayerSquad(
      id: id,
      name: name,
      age: age,
      position: position,
      number: number,
      photo: photo,
    );
  }
}

extension TeamSquadExtinsion on TeamSquadModel {
  TeamSquad toDomain() {
    return TeamSquad(
      playerSquad: playerSquad,
      team: team,
    );
  }
}
