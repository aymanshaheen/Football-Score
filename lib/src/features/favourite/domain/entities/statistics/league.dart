import 'package:equatable/equatable.dart';
class Leagues extends Equatable {
  const Leagues({
    required this.country,
    required this.flag,
    required this.id,
    required this.logo,
    required this.name,
    required this.season,
  });

  final String? country;
  final String? flag;
  final int? id;
  final String? logo;
  final String? name;
  final num? season;

  @override
  List<Object?> get props => [
        country,
        flag,
        id,
        logo,
        name,
        season,
      ];
}
