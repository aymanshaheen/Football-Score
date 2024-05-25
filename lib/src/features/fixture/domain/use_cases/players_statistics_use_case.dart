import 'package:Goal/src/features/fixture/domain/entities/player_statistics.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/fixture_repository.dart';

class PlayersStatisticsUseCase
    implements UseCase<List<FixtureStatistics>, String> {
  final FixtureRepository fixtureRepository;

  PlayersStatisticsUseCase({required this.fixtureRepository});

  @override
  Future<Either<Failure, List<FixtureStatistics>>> call(
      String fixtureId) async {
    return await fixtureRepository.getPlayersStatistics(fixtureId);
  }
}
