import 'package:equatable/equatable.dart';

class LeagueInfo extends Equatable {
  final Leagueinfo league;
  final Country country;

  const LeagueInfo({required this.league, required this.country});

 

  @override
  List<Object> get props => [league, country];
}

class Leagueinfo extends Equatable {
  final int id;
  final String name;
  final String type;
  final String logo;

  const Leagueinfo({required this.id, required this.name, required this.type, required this.logo});

  

  @override
  List<Object> get props => [id, name, type, logo];
}

class Country extends Equatable {
  final String name;
  final String code;
  final String flag;

  const Country({required this.name, required this.code, required this.flag});

  

  @override
  List<Object> get props => [name, code, flag];
}