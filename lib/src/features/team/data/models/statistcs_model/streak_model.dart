import 'package:Goal/src/features/team/domain/entities/statistics/streak.dart';

class StreakModel extends Streak {
  const StreakModel({
    required super.draws,
    required super.loses,
    required super.wins,
  });

  factory StreakModel.fromJson(Map<String, dynamic> json) {
    return StreakModel(
      draws: json["draws"],
      loses: json["loses"],
      wins: json["wins"],
    );
  }
}
