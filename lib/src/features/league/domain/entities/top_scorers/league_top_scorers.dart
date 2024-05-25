import 'package:Goal/src/features/league/domain/entities/top_scorers/statistics_top_scorers.dart';
import 'package:equatable/equatable.dart';

class PlayerTopScorers extends Equatable {
  final int id;
  final String name;
  final String photo;
  final StatisticsTopScorers statistics;

  const PlayerTopScorers(
      {required this.photo,
      required this.id,
      required this.name,
      required this.statistics});

  @override
  List<Object?> get props => [id, name, photo, statistics];
}
