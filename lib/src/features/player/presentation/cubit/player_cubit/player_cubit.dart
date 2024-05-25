import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';
import 'package:Goal/src/features/player/domain/use_case/add_favourite.dart';
import 'package:Goal/src/features/player/domain/use_case/delete_favourite.dart';
import 'package:Goal/src/features/player/domain/use_case/player_info_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'player_state.dart';

class PlayerCubit extends Cubit<PlayerStates> {
  final PlayerInfoUseCase playerUseCase;
  final AddFavouriteUseCase addFavouriteUseCase;
  final DeleteFavouriteUseCase deleteFavouriteUseCase;
  PlayerCubit(
      {required this.addFavouriteUseCase,
      required this.deleteFavouriteUseCase,
      required this.playerUseCase})
      : super(PlayerInitial());
  static PlayerCubit get(context) => BlocProvider.of(context);
  PlayerStatsInfo? playerStatsInfo;
  Future<void> getPlayerInfo(PlayerParams params) async {
    emit(PlayerLoading());
    final player = await playerUseCase(params);
    player.fold(
      (left) => emit(PlayerLoadedError(left.message)),
      (right) {
        playerStatsInfo = right;
        emit(PlayerLoaded(right));
      },
    );
  }

  Future<void> addFavourite({
    required String id,
    required String photo,
    required String name,
  }) async {
    emit(AddFavouriteLoading());
    final result = await addFavouriteUseCase(
      id: id,
      photo: photo,
      name: name,
    );
    result.fold(
      (left) => emit(AddFavouriteFailure(left.message)),
      (right) {
        emit(AddFavouriteLoaded());
      },
    );
  }

  Future<void> deleteFavourite({
    required String id,
  }) async {
    emit(DeleteFavouriteLoading());
    final result = await deleteFavouriteUseCase(
      id: id,
    );
    result.fold(
      (left) => emit(DeleteFavouriteFailure(left.message)),
      (right) {
        emit(DeleteFavouriteLoaded());
      },
    );
  }
}
