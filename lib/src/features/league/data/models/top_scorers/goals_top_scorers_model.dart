import 'package:Goal/src/features/league/domain/entities/top_scorers/goals_top_scorers.dart';

class GoalsTopScorerModel extends GoalsTopScorers {
  const GoalsTopScorerModel({required super.assists, required super.total});

  factory GoalsTopScorerModel.fromJson(Map<String, dynamic> json) {
    return GoalsTopScorerModel(
      assists: json['assists'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}
