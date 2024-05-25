import 'package:equatable/equatable.dart';



class PlayerSquad extends Equatable {
  final int id;
  final String name;
  final int age;
  final int number;
  final String position;
  final String photo;

  const PlayerSquad({
    required this.id,
    required this.name,
    required this.age,
    required this.position,
    required this.number,
    required this.photo,
  });

  @override
  List<Object?> get props => [id, name, age, position, photo, number];

}