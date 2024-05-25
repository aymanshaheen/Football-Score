import 'package:equatable/equatable.dart';
class Lineups extends Equatable {
  const Lineups({
    required this.formation,
    required this.played,
  });

  final String? formation;
  final num? played;

  @override
  List<Object?> get props => [
        formation,
        played,
      ];
}
