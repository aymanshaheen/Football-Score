part of 'fixture_cubit.dart';

@immutable
abstract class FixtureState {}

class FixtureInitial extends FixtureState {}

class FixtureChangeBar extends FixtureState {}

class FixtureStatisticsLoading extends FixtureState {}

class FixtureStatisticsLoaded extends FixtureState {
  final List<Statistics> statistics;

  FixtureStatisticsLoaded({required this.statistics});
}

class FixtureStatisticsLoadingFailure extends FixtureState {
  final String message;

  FixtureStatisticsLoadingFailure({required this.message});
}
class FixturePlayersStatisticsLoading extends FixtureState {}

class FixturePlayersStatisticsLoaded extends FixtureState {
  final List<FixtureStatistics> playersStatistics;

  FixturePlayersStatisticsLoaded({required this.playersStatistics});
}

class FixturePlayersStatisticsLoadingFailure extends FixtureState {
  final String message;

  FixturePlayersStatisticsLoadingFailure({required this.message});
}
class FixtureH2HLoading extends FixtureState {}

class FixtureH2HLoaded extends FixtureState {
  final List<H2H> h2h;

  FixtureH2HLoaded({required this.h2h});
}

class FixtureH2HLoadingFailure extends FixtureState {
  final String message;

  FixtureH2HLoadingFailure({required this.message});
}
class FixtureLineupsLoading extends FixtureState {}

class FixtureLineupsLoaded extends FixtureState {
  final List<Lineup> lineups;

  FixtureLineupsLoaded({required this.lineups});
}

class FixtureLineupsLoadingFailure extends FixtureState {
  final String message;

  FixtureLineupsLoadingFailure({required this.message});
}

class FixtureEventsLoading extends FixtureState {}

class FixtureEventsLoaded extends FixtureState {
  final List<Event> events;

  FixtureEventsLoaded({required this.events});
}

class FixtureEventsLoadingFailure extends FixtureState {
  final String message;

  FixtureEventsLoadingFailure({required this.message});
}
