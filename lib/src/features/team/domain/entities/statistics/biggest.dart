import 'package:equatable/equatable.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/against.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/for.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/loses.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/streak.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/win.dart';

class Biggest extends Equatable {
  const Biggest({
    required this.goals,
    required this.loses,
    required this.streak,
    required this.wins,
  });

  final BiggestGoals? goals;
  final Loses? loses;
  final Streak? streak;
  final Win? wins;

  @override
  List<Object?> get props => [
        goals,
        loses,
        streak,
        wins,
      ];
}

class BiggestGoals extends Equatable {
  const BiggestGoals({
    required this.against,
    required this.goalsFor,
  });

  final Against? against;
  final For? goalsFor;

  @override
  List<Object?> get props => [
        against,
        goalsFor,
      ];
}
