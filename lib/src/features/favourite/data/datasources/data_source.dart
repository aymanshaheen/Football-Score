import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/features/Favourite/data/models/favourite_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/api/dio_helper.dart';

abstract class FavouriteDataSource {
  Stream<List<FavouriteModel>> getFavourite();
  Stream<List<FavouriteModel>> getPlayers();
}

class FavouriteDataSourceImpl implements FavouriteDataSource {
  final DioHelper dioHelper;
  final FirebaseFirestore firestore;

  FavouriteDataSourceImpl({required this.firestore, required this.dioHelper});

  @override
  Stream<List<FavouriteModel>> getFavourite() {
    return firestore
        .collection('users')
        .doc(AppConstants.token)
        .collection('favorites')
        .doc('teams')
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FavouriteModel.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Stream<List<FavouriteModel>> getPlayers() {
    return firestore
        .collection('users')
        .doc(AppConstants.token)
        .collection('favorites')
        .doc('players')
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FavouriteModel.fromMap(doc.data()))
          .toList();
    });
  }
}
