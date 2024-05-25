import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/goals_top_scorers.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/penalty_top_scorers.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/red_card.dart';
import 'package:equatable/equatable.dart';

class StatisticsTopScorers extends Equatable {
  final GoalsTopScorers goals;
  final PenaltyTopScorers penalty;
  final Team team;
  final RedCardTopScorers cards;

  const StatisticsTopScorers(
      {required this.cards,
      required this.goals,
      required this.penalty,
      required this.team});

  @override
  List<Object?> get props => [goals, penalty, team, cards];
}
