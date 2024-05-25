import 'package:Goal/src/features/favourite/domain/repositories/repository.dart';
import 'package:Goal/src/features/team/domain/entities/favourite.dart';

class GetFavouriteUseCase {
  final FavouriteRepository favouriteRepository;

  GetFavouriteUseCase({required this.favouriteRepository});

  Stream<List<Favourite>> call()  {
    return  favouriteRepository.getFavourite();
  }
}
