import 'package:equatable/equatable.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/for.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/fulffy_goal.dart';

class StatisticsGoals extends Equatable {
  const StatisticsGoals({
    required this.against,
    required this.goalsFor,
  });

  final FluffyAgainst? against;
  final For? goalsFor;

  @override
  List<Object?> get props => [
        against,
        goalsFor,
      ];
}
