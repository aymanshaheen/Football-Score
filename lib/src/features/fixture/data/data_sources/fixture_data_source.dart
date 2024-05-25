import 'package:Goal/src/features/fixture/data/models/h2h_model.dart';
import 'package:Goal/src/features/fixture/data/models/players_statistics_model.dart';
import '../../../../core/api/dio_helper.dart';
import '../../../../core/api/endpoints.dart';
import '../models/event_model.dart';
import '../models/lineups_model.dart';
import '../models/statistics_model.dart';

abstract class FixtureDataSource {
  Future<List<StatisticsModel>> getStatistics(String fixtureId);

  Future<List<LineupModel>> getLineups(String fixtureId);

  Future<List<EventModel>> getEvents(String fixtureId);
  Future<List<H2HModel>> getH2H(String fixtureId);
  Future<List<FixturesStatisticsModel>> getPlayerStatistics(String fixtureId);
}

class FixtureDataSourceImpl implements FixtureDataSource {
  final DioHelper dioHelper;

  FixtureDataSourceImpl({required this.dioHelper});

  @override
  Future<List<EventModel>> getEvents(String fixtureId) async {
    try {
      final response = await dioHelper.get(
        url: "${Endpoints.fixtures}/${Endpoints.events}",
        queryParams: {"fixture": fixtureId},
      );
      List<dynamic> result = response.data["response"];
      List<EventModel> events = List<EventModel>.from(
        result.map((event) => EventModel.fromJson(event)),
      );
      return events;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<H2HModel>> getH2H(String teams) async {
    try {
      final response = await dioHelper.get(url: Endpoints.h2h, queryParams: {
        'fixture': teams,
      });
      List<dynamic> result = response.data["response"];
      List<H2HModel> events = List<H2HModel>.from(
        result.map((event) => H2HModel.fromJson(event)),
      );
      return events;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<FixturesStatisticsModel>> getPlayerStatistics(
      String teams) async {
    try {
      final response =
          await dioHelper.get(url: Endpoints.playerStatistics, queryParams: {
        'fixture': teams,
      });
      List<dynamic> result = response.data["response"];
      List<FixturesStatisticsModel> events = List<FixturesStatisticsModel>.from(
        result.map((event) => FixturesStatisticsModel.fromJson(event)),
      );
      return events;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<LineupModel>> getLineups(String fixtureId) async {
    try {
      final response = await dioHelper.get(
        url: "${Endpoints.fixtures}/${Endpoints.lineups}",
        queryParams: {"fixture": fixtureId},
      );
      List<dynamic> result = response.data["response"];
      List<LineupModel> lineups = List<LineupModel>.from(
        result.map((lineup) => LineupModel.fromJson(lineup)),
      );

      return lineups;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<StatisticsModel>> getStatistics(String fixtureId) async {
    try {
      final response = await dioHelper.get(
        url: "${Endpoints.fixtures}/${Endpoints.statistics}",
        queryParams: {"fixture": fixtureId},
      );
      List<dynamic> result = response.data["response"];
      List<StatisticsModel> statistics = List<StatisticsModel>.from(
        result.map((statistic) => StatisticsModel.fromJson(statistic)),
      );
      return statistics;
    } catch (error) {
      rethrow;
    }
  }
}
