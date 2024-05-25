import 'package:Goal/src/features/team/domain/entities/statistics/league.dart';

class LeaguesModel extends Leagues {
  const LeaguesModel({
    required super.country,
    required super.flag,
    required super.id,
    required super.logo,
    required super.name,
    required super.season,
  });

  factory LeaguesModel.fromJson(Map<String, dynamic> json) {
    return LeaguesModel(
      country: json["country"],
      flag: json["flag"],
      id: json["id"],
      logo: json["logo"],
      name: json["name"],
      season: json["season"],
    );
  }
}
