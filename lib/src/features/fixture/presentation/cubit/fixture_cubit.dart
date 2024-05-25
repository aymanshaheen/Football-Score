import 'package:Goal/src/features/fixture/domain/entities/h2h.dart';
import 'package:Goal/src/features/fixture/domain/entities/player_statistics.dart';
import 'package:Goal/src/features/fixture/domain/use_cases/h2h_use_case.dart';
import 'package:Goal/src/features/fixture/domain/use_cases/players_statistics_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/events_usecase.dart';
import '../../domain/use_cases/lineups_usecase.dart';
import '../../domain/entities/events.dart';
import '../../domain/entities/lineups.dart';
import '../../domain/entities/statistics.dart';
import '../../domain/use_cases/statistics_usecase.dart';

part 'fixture_state.dart';

class FixtureCubit extends Cubit<FixtureState> {
  final StatisticUseCase statisticsUseCase;
  final LineupsUseCase lineupsUseCase;
  final EventsUseCase eventsUseCase;
  final H2HUseCase h2hUseCase;
  final PlayersStatisticsUseCase playersStatisticsUseCase;

  FixtureCubit({
    required this.statisticsUseCase,
    required this.playersStatisticsUseCase,
    required this.lineupsUseCase,
    required this.h2hUseCase,
    required this.eventsUseCase,
  }) : super(FixtureInitial());
  static FixtureCubit get(context) => BlocProvider.of(context);

  List<Statistics> statistics = [];

  Future<void> getStatistics(String fixtureId) async {
    if (statistics.isEmpty) {
      emit(FixtureStatisticsLoading());
      final result = await statisticsUseCase(fixtureId);
      result.fold(
        (left) {
          emit(FixtureStatisticsLoadingFailure(message: left.message));
        },
        (right) {
          statistics = right;
          emit(FixtureStatisticsLoaded(statistics: right));
        },
      );
    } else {
      emit(FixtureStatisticsLoaded(statistics: statistics));
    }
  }

  List<Lineup> lineups = [];
  Map<int, String> playerPhotos = {};
  Map<int, PlayerStatistics> playerStatistics = {};

  Future<void> getLineups(String fixtureId) async {
    if (lineups.isEmpty) {
      emit(FixtureLineupsLoading());
      final result = await lineupsUseCase(fixtureId);
      result.fold(
        (left) => emit(FixtureLineupsLoadingFailure(message: left.message)),
        (right) {
          lineups = right;
          emit(FixtureLineupsLoaded(lineups: right));
        },
      );
    } else {
      emit(FixtureLineupsLoaded(lineups: lineups));
    }
  }

  List<FixtureStatistics> playersStatistics = [];

  Future<void> getplayersStatistics(String fixtureId) async {
    if (lineups.isEmpty) {
      emit(FixturePlayersStatisticsLoading());
      final result = await playersStatisticsUseCase(fixtureId);
      result.fold(
        (left) =>
            emit(FixturePlayersStatisticsLoadingFailure(message: left.message)),
        (right) {
          playersStatistics = right;
          for (var team in right) {
            for (var player in team.players) {
              playerPhotos[player.player.id] = player.player.photo;
              playerStatistics[player.player.id] = player.statistics.first;
            }
          }
          emit(FixturePlayersStatisticsLoaded(playersStatistics: right));
        },
      );
    } else {
      emit(
          FixturePlayersStatisticsLoaded(playersStatistics: playersStatistics));
    }
  }

  List<Event> events = [];

  Future<void> getEvents(String fixtureId) async {
    if (events.isEmpty) {
      emit(FixtureEventsLoading());
      final result = await eventsUseCase(fixtureId);
      result.fold(
        (left) {
          emit(FixtureEventsLoadingFailure(message: left.message));
        },
        (right) {
          events = right;
          emit(FixtureEventsLoaded(events: right));
        },
      );
    } else {
      emit(FixtureEventsLoaded(events: events));
    }
  }

  List<H2H> h2hFixtures = [];

  Future<void> getH2H(String fixtureId) async {
    if (h2hFixtures.isEmpty) {
      emit(FixtureH2HLoading());
      final result = await h2hUseCase(fixtureId);
      result.fold(
        (left) => emit(FixtureH2HLoadingFailure(message: left.message)),
        (right) {
          h2hFixtures = right;
          emit(FixtureH2HLoaded(h2h: right));
        },
      );
    } else {
      emit(FixtureH2HLoaded(h2h: h2hFixtures));
    }
  }
}
