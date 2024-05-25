import 'package:equatable/equatable.dart';

class PlayerLi extends Equatable {
  final int id;
  final String name;
  final int number;
  final String pos;
  final String grid;

  const PlayerLi({
    required this.id,
    required this.name,
    required this.number,
    required this.grid,
    required this.pos,
  });

  @override
  List<Object?> get props => [id, name, number, pos, grid];
}
