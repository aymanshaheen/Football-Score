import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/features/player/domain/repositories/player_repository.dart';
import 'package:dartz/dartz.dart';

class AddFavouriteUseCase {
  final PlayerRepository teamRepository;

  AddFavouriteUseCase({required this.teamRepository});

  Future<Either<Failure, void>> call(
      {required String id, required String photo, required String name}) async {
    return await teamRepository.saveFavorite(id: id, photo: photo, name: name);
  }
}
