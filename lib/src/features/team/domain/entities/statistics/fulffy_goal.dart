import 'package:equatable/equatable.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/average.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/clean_sheet.dart';

class FluffyAgainst extends Equatable {
  const FluffyAgainst({
    required this.average,
    required this.total,
  });

  final Average? average;
  final CleanSheet? total;

  @override
  List<Object?> get props => [
        average,
        total,
      ];
}
