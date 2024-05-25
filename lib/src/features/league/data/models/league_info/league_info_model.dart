import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';

class LeagueInfoModel extends LeagueInfo {
  const LeagueInfoModel({required super.league, required super.country});

  factory LeagueInfoModel.fromJson(Map<String, dynamic> json) {
    return LeagueInfoModel(
      league: LeagueModel.fromJson(json['league']),
      country: CountryModel.fromJson(json['country']),
    );
  }
}

class LeagueModel extends Leagueinfo {
  const LeagueModel(
      {required super.id,
      required super.name,
      required super.type,
      required super.logo});

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      logo: json['logo'],
    );
  }
}

class CountryModel extends Country {
  const CountryModel(
      {required super.name, required super.code, required super.flag});
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      code: json['code'],
      flag: json['flag'],
    );
  }
}
