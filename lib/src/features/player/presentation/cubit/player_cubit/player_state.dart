import 'package:Goal/src/features/player/domain/entities/player_info/player_stats.dart';

abstract class PlayerStates {}

class PlayerInitial extends PlayerStates {}

class PlayerLoading extends PlayerStates {}

class PlayerLoaded extends PlayerStates {
  final PlayerStatsInfo player;

  PlayerLoaded(this.player);
}

class PlayerLoadedError extends PlayerStates {
  final String message;

  PlayerLoadedError(this.message);
}
class AddFavouriteLoading extends PlayerStates {}

class AddFavouriteLoaded extends PlayerStates {
  AddFavouriteLoaded();
}

class AddFavouriteFailure extends PlayerStates {
  final String message;

  AddFavouriteFailure(this.message);
}

class DeleteFavouriteLoading extends PlayerStates {}

class DeleteFavouriteLoaded extends PlayerStates {
  DeleteFavouriteLoaded();
}

class DeleteFavouriteFailure extends PlayerStates {
  final String message;

  DeleteFavouriteFailure(this.message);
}
