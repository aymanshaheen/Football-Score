import 'package:Goal/src/features/favourite/domain/use_cases/get_favourite.dart';
import 'package:Goal/src/features/favourite/domain/use_cases/get_players.dart';
import 'package:Goal/src/features/team/domain/entities/favourite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  final GetFavouriteUseCase getfavouritesUseCase;
  final GetplayersUseCase getplayersUseCase;
  FavouriteCubit(
      {required this.getplayersUseCase, required this.getfavouritesUseCase})
      : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);
  Stream<List<Favourite>> getFavourite() {
    return getfavouritesUseCase();
  }

  Stream<List<Favourite>> getPlayers() {
    return getplayersUseCase();
  }
}
