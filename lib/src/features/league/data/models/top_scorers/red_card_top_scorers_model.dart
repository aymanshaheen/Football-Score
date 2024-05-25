import 'package:Goal/src/features/league/domain/entities/top_scorers/red_card.dart';

class RedCardModel extends RedCardTopScorers {
  const RedCardModel(
      {required super.yellow, required super.red, required super.yellowred});

  factory RedCardModel.fromJson(Map<String, dynamic> json) {
    return RedCardModel(
      yellow: json['yellow'] ?? 0,
      red: json['red'] ?? 0,
      yellowred: json['yellowred'] ?? 0,
    );
  }
}
