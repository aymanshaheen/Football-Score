import 'package:equatable/equatable.dart';

class Average extends Equatable {
  const Average({
    required this.away,
    required this.home,
    required this.total,
  });

  final String? away;
  final String? home;
  final String? total;

  @override
  List<Object?> get props => [
        away,
        home,
        total,
      ];
}
