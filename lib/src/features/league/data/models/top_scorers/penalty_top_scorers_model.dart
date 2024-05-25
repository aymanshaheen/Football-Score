import 'package:Goal/src/features/league/domain/entities/top_scorers/penalty_top_scorers.dart';

class PenaltyTopScorersModel extends PenaltyTopScorers {
  const PenaltyTopScorersModel({required super.scored});
  factory PenaltyTopScorersModel.fromJson(Map<String, dynamic> json) {
    return PenaltyTopScorersModel(
      scored: json['scored'] ?? 0,
    );
  }
}
