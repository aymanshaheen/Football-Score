import 'package:Goal/src/features/team/domain/entities/player_squad/player_Squad.dart';

class PlayerSquadModel extends PlayerSquad {
  const PlayerSquadModel(
      {required super.id,
      required super.number,
      required super.name,
      required super.age,
      required super.position,
      required super.photo});

  factory PlayerSquadModel.fromJson(Map<String, dynamic> json) {
    return PlayerSquadModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      number: json['number'] ?? 0,
      position: json['position'] ?? '',
      photo: json['photo'] ?? '',
    );
  }
}
