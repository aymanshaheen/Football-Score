import 'package:Goal/src/features/team/domain/entities/statistics/lineup.dart';

class LineupsModel extends Lineups {
  const LineupsModel({
    required super.formation,
    required super.played,
  });

  factory LineupsModel.fromJson(Map<String, dynamic> json) {
    return LineupsModel(
      formation: json["formation"],
      played: json["played"],
    );
  }
}
