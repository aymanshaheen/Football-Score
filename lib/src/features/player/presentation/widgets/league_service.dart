import 'package:Goal/src/features/player/presentation/cubit/player_cubit/player_cubit.dart';
import 'package:Goal/src/features/player/domain/use_case/player_info_use_case.dart';

class PlayerService {
  final PlayerCubit playerCubit;

  PlayerService({required this.playerCubit});

  Future<void> getLists({required String player}) async {
    PlayerParams playerParams =
        PlayerParams(playerId: player, season: "2023");
    await playerCubit.getPlayerInfo(playerParams);
  }
}
