import 'package:Goal/src/features/team/domain/entities/favourite.dart';


abstract class FavouriteRepository {

  Stream<List<Favourite>> getFavourite();
  Stream<List<Favourite>> getPlayers();
}
