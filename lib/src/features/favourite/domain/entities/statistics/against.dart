
import 'package:equatable/equatable.dart';

class Against extends Equatable {
  const Against({
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
