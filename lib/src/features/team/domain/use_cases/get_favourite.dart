import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class AddFavouriteUseCase {
  final TeamRepository teamRepository;

  AddFavouriteUseCase({required this.teamRepository});

  Future<Either<Failure, void>> call(
      {required String id, required String photo, required String name}) async {
    return await teamRepository.saveFavorite(id: id, photo: photo, name: name);
  }
}
