import 'package:Goal/src/features/fixture/domain/entities/h2h.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/fixture_repository.dart';

class H2HUseCase implements UseCase<List<H2H>, String> {
  final FixtureRepository fixtureRepository;

  H2HUseCase({required this.fixtureRepository});

  @override
  Future<Either<Failure, List<H2H>>> call(String teams) async {
    return await fixtureRepository.getH2H(teams);
  }
}
