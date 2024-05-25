import 'package:Goal/src/core/api/dio_helper.dart';
import 'package:Goal/src/core/api/endpoints.dart';
import 'package:Goal/src/core/models/soccer_fixture_model.dart';
import 'package:Goal/src/features/league/data/models/league_info/league_info_model.dart';
import 'package:Goal/src/features/league/data/models/top_scorers/league_top_scorers_model.dart';
import 'package:Goal/src/features/league/domain/use_case/league_match_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_asistis_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_red_card_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_scorers_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_yellow_card_use_case.dart';
import 'package:dio/dio.dart';

abstract class LeagueDataSource {
  Future<List<PlayerTopScorersModel>> getTopScorers({
    required ScorersParams league,
  });
  Future<List<PlayerTopScorersModel>> getTopAsistis({
    required AsistsParams league,
  });
  Future<List<PlayerTopScorersModel>> getRedCards({
    required RedParams league,
  });
  Future<List<PlayerTopScorersModel>> getYellowCards({
    required YellowParams league,
  });
  Future<LeagueInfoModel> getLeagueInfo({
    required int league,
  });
  Future<List<SoccerFixtureModel>> getLeagueMatches(
      {required LeagueMatchesParameter params});
}

class LeagueDataSourceImpl implements LeagueDataSource {
  final DioHelper dioHelper;

  LeagueDataSourceImpl({required this.dioHelper});

  @override
  Future<List<PlayerTopScorersModel>> getTopScorers(
      {required ScorersParams league}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.topScoreres, queryParams: league.toJson());
      return _getResult(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<PlayerTopScorersModel>> getTopAsistis(
      {required AsistsParams league}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.topAssists, queryParams: league.toJson());
      return _getResult(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<PlayerTopScorersModel>> getRedCards(
      {required RedParams league}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.topRedCards, queryParams: league.toJson());
      return _getResult(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<PlayerTopScorersModel>> getYellowCards(
      {required YellowParams league}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.topYellowCards, queryParams: league.toJson());
      return _getResult(response);
    } catch (error) {
      rethrow;
    }
  }

  List<PlayerTopScorersModel> _getResult(Response response) {
    List<dynamic> result = response.data["response"];
    List<PlayerTopScorersModel> players =
        List<PlayerTopScorersModel>.from(result.map(
      (player) => PlayerTopScorersModel.fromJson(player),
    ));
    return players;
  }

  @override
  Future<LeagueInfoModel> getLeagueInfo({required int league}) async {
    try {
      final response = await dioHelper
          .get(url: Endpoints.leagues, queryParams: {"league": league});
      return _getLeagueInfoResult(response);
    } catch (error) {
      rethrow;
    }
  }

  LeagueInfoModel _getLeagueInfoResult(Response response) {
    Map<String, dynamic> result = response.data["response"];
    return LeagueInfoModel.fromJson(result);
  }

  @override
  Future<List<SoccerFixtureModel>> getLeagueMatches(
      {required LeagueMatchesParameter params}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.fixtures, queryParams: params.toJson());
      return _getMatchesResult(response);
    } catch (error) {
      rethrow;
    }
  }

  List<SoccerFixtureModel> _getMatchesResult(Response response) {
    List<dynamic> result = response.data["response"];
    List<SoccerFixtureModel> fixtures =
        List<SoccerFixtureModel>.from(result.map(
      (fixture) => SoccerFixtureModel.fromJson(fixture),
    ));
    return fixtures;
  }
}
