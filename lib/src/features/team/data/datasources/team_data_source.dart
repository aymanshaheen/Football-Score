import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/features/team/data/models/player_squad/team_squad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:Goal/src/core/models/soccer_fixture_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/statistcs_model.dart';
import 'package:Goal/src/features/team/domain/use_cases/last_matches_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/next_match_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/statistics_use_case.dart';
import '../../../../core/api/dio_helper.dart';
import '../../../../core/api/endpoints.dart';

abstract class TeamDataSource {
  Future<TeamStatisticsModel> getStatistics({required StatisticsParams params});
  Future<List<SoccerFixtureModel>> getLastMatches(
      {required LastMatchesParams params});
  Future<void> deleteFavorite(String id);
  Future<void> saveFavorite(String id, String photo, String name);
  Future<List<SoccerFixtureModel>> getNextMatches(
      {required NextMatchesParams params});
  Future<TeamSquadModel> getPlayerSquad({required int teamId});
}

class TeamDataSourceImpl implements TeamDataSource {
  final DioHelper dioHelper;

  TeamDataSourceImpl({required this.dioHelper});
  @override
  Future<void> deleteFavorite(String id) async {
    DocumentReference user =
        FirebaseFirestore.instance.collection('users').doc(AppConstants.token);
    CollectionReference favorites = user.collection('favorites');
 CollectionReference typeFavorites =
        favorites.doc('teams').collection('items');
    return typeFavorites.doc(id).delete();
  }

  @override
  Future<void> saveFavorite(String id, String photo, String name) async {
    DocumentReference user =
        FirebaseFirestore.instance.collection('users').doc(AppConstants.token);
    CollectionReference favorites = user.collection('favorites');
    CollectionReference typeFavorites =
        favorites.doc('teams').collection('items');
    return typeFavorites.doc(id).set({
      'id': id,
      'photo': photo,
      'name': name,
    });
  }

  @override
  Future<TeamStatisticsModel> getStatistics(
      {required StatisticsParams params}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.teamsStatistics, queryParams: params.toJson());
      Map<String, dynamic> result = response.data["response"];
      TeamStatisticsModel statistics = TeamStatisticsModel.fromJson(result);
      return statistics;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<SoccerFixtureModel>> getLastMatches(
      {required LastMatchesParams params}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.fixtures, queryParams: params.toJson());
      return _getMatchesResult(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<SoccerFixtureModel>> getNextMatches(
      {required NextMatchesParams params}) async {
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

  @override
  Future<TeamSquadModel> getPlayerSquad({required int teamId}) async {
    try {
      final response = await dioHelper
          .get(url: Endpoints.playerSquad, queryParams: {"team": teamId});
      Map<String, dynamic> result = response.data["response"][0];
      TeamSquadModel squads = TeamSquadModel.fromJson(result);
      return squads;
    } catch (error) {
      rethrow;
    }
  }
}
