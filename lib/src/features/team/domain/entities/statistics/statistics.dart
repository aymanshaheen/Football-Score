import 'package:equatable/equatable.dart';
import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/biggest.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/clean_sheet.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/fixtures.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/league.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/lineup.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics_goals.dart';

class TeamStatistics extends Equatable {
  const TeamStatistics({
    required this.biggest,
    required this.cleanSheet,
    required this.failedToScore,
    required this.fixtures,
    required this.form,
    required this.goals,
    required this.league,
    required this.lineups,
    required this.team,
  });

  final Biggest? biggest;
  final CleanSheet? cleanSheet;
  final CleanSheet? failedToScore;
  final Fixtures? fixtures;
  final String? form;
  final StatisticsGoals? goals;
  final Leagues? league;
  final List<Lineups> lineups;
  final Team? team;

  @override
  List<Object?> get props => [
        biggest,
        cleanSheet,
        failedToScore,
        fixtures,
        form,
        goals,
        league,
        lineups,
        team,
      ];
}
