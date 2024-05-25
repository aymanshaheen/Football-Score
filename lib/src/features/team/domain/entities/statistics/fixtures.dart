import 'package:equatable/equatable.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/clean_sheet.dart';

class Fixtures extends Equatable {
  const Fixtures({
    required this.draws,
    required this.loses,
    required this.played,
    required this.wins,
  });

  final CleanSheet? draws;
  final CleanSheet? loses;
  final CleanSheet? played;
  final CleanSheet? wins;

  @override
  List<Object?> get props => [
        draws,
        loses,
        played,
        wins,
      ];
}
