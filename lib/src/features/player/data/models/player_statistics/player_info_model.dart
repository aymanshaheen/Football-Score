import 'package:Goal/src/features/player/domain/entities/player_info/player_info.dart';
import 'package:Goal/src/features/player/domain/mappers/mappers.dart';

class PlayerInfModel extends PlayerInfo {
  const PlayerInfModel(
      {required super.id,
      required super.name,
      required super.firstname,
      required super.lastname,
      required super.age,
      required super.birth,
      required super.nationality,
      required super.height,
      required super.weight,
      required super.injured,
      required super.photo});

  factory PlayerInfModel.fromJson(Map<String, dynamic> json) {
    return PlayerInfModel(
      id: json['id'],
      name: json['name'] ?? "",
      firstname: json['firstname'] ?? "",
      lastname: json['lastname'] ?? '',
      age: json['age'] ?? 0,
      birth: BirthModel.fromJson(json['birth']).toDomain(),
      nationality: json['nationality'] ?? '',
      height: json['height'] ?? '',
      weight: json['weight'] ?? '',
      injured: json['injured'] ?? false,
      photo: json['photo'],
    );
  }
}

class BirthModel extends Birth {
  const BirthModel(
      {required super.date, required super.place, required super.country});
  factory BirthModel.fromJson(Map<String, dynamic> json) {
    return BirthModel(
      date: json['date'] ?? "",
      place: json['place'] ?? '',
      country: json['country'] ?? '',
    );
  }
}
