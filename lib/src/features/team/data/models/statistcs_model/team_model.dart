import 'package:Goal/src/core/domain/entities/teams.dart';

class TeamstModel extends Team {
  const TeamstModel({
    required super.id,
    required super.logo,
    required super.name,
  });

  factory TeamstModel.fromJson(Map<String, dynamic> json) {
    return TeamstModel(
      id: json["id"],
      logo: json["logo"],
      name: json["name"],
    );
  }
}
