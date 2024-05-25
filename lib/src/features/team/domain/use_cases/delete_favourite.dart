import 'package:Goal/src/core/error/error_handler.dart';
import 'package:Goal/src/features/team/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteFavouriteUseCase {
  final TeamRepository teamRepository;

  DeleteFavouriteUseCase({required this.teamRepository});

  Future<Either<Failure, void>> call({required String id}) async {
    return await teamRepository.deleteFavorite(id: id);
  }
}
