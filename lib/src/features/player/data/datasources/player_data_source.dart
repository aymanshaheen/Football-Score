import 'package:Goal/src/core/api/dio_helper.dart';
import 'package:Goal/src/core/api/endpoints.dart';
import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/features/player/data/models/player_statistics/player_stats_model.dart';
import 'package:Goal/src/features/player/domain/use_case/player_info_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PlayerDataSource {
  Future<PlayerStatsModelInfo> getPlayerInfo({required PlayerParams params});
    Future<void> deleteFavorite(String id);
  Future<void> saveFavorite(String id, String photo, String name);
}

class PlayerDataSourceImpl implements PlayerDataSource {
  final DioHelper dioHelper;

  PlayerDataSourceImpl({required this.dioHelper});
 @override
  Future<void> deleteFavorite(String id) async {
    DocumentReference user =
        FirebaseFirestore.instance.collection('users').doc(AppConstants.token);
    CollectionReference favorites = user.collection('favorites');
 CollectionReference typeFavorites =
        favorites.doc('players').collection('items');
    return typeFavorites.doc(id).delete();
  }

  @override
  Future<void> saveFavorite(String id, String photo, String name) async {
    DocumentReference user =
        FirebaseFirestore.instance.collection('users').doc(AppConstants.token);
    CollectionReference favorites = user.collection('favorites');
    CollectionReference typeFavorites =
        favorites.doc('players').collection('items');
    return typeFavorites.doc(id).set({
      'id': id,
      'photo': photo,
      'name': name,
    });
  }
  @override
  Future<PlayerStatsModelInfo> getPlayerInfo(
      {required PlayerParams params}) async {
    try {
      final response = await dioHelper.get(
          url: Endpoints.player, queryParams: params.toJson());
      Map<String, dynamic> result = response.data["response"][0];
      PlayerStatsModelInfo statistics = PlayerStatsModelInfo.fromJson(result);
      return statistics;
    } catch (error) {
      rethrow;
    }
  }
}
