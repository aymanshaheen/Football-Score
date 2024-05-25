import 'package:equatable/equatable.dart';

class PlayerInfo extends Equatable {
  final int id;
  final String name;
  final String firstname;
  final String lastname;
  final int age;
  final Birth birth;
  final String nationality;
  final String height;
  final String weight;
  final bool injured;
  final String photo;

  const PlayerInfo({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.birth,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.injured,
    required this.photo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        firstname,
        lastname,
        age,
        birth,
        nationality,
        height,
        weight,
        injured,
        photo
      ];
}

class Birth extends Equatable {
  final String date;
  final String place;
  final String country;

  const Birth({
    required this.date,
    required this.place,
    required this.country,
  });

  @override
  List<Object?> get props => [date, place, country];
}
