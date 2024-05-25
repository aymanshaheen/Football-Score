import 'package:equatable/equatable.dart';

class Streak extends Equatable {
  const Streak({
    required this.draws,
    required this.loses,
    required this.wins,
  });

  final num? draws;
  final num? loses;
  final num? wins;

  @override
  List<Object?> get props => [
        draws,
        loses,
        wins,
      ];
}