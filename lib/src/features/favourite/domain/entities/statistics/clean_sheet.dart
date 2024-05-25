import 'package:equatable/equatable.dart';

class CleanSheet extends Equatable {
  const CleanSheet({
    required this.away,
    required this.home,
    required this.total,
  });

  final num away;
  final num home;
  final num total;

  @override
  List<Object?> get props => [
        away,
        home,
        total,
      ];
}
