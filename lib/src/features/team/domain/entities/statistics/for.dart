import 'package:equatable/equatable.dart';

class For extends Equatable {
  const For({
    required this.away,
    required this.home,
  });

  final num? away;
  final num? home;

  @override
  List<Object?> get props => [
        away,
        home,
      ];
}
