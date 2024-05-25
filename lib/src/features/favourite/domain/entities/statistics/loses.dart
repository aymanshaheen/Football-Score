import 'package:equatable/equatable.dart';

class Loses extends Equatable {
  const Loses({
    required this.away,
    required this.home,
  });

  final String? away;
  final String? home;

  @override
  List<Object?> get props => [
        away,
        home,
      ];
}
