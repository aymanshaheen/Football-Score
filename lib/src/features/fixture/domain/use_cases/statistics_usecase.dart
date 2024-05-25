import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/statistics.dart';
import '../repositories/fixture_repository.dart';

class StatisticUseCase implements UseCase<List<Statistics>, String> {
  final FixtureRepository fixtureRepository;

  StatisticUseCase({required this.fixtureRepository});

  @override
  Future<Either<Failure, List<Statistics>>> call(String params) async {
    return await fixtureRepository.getStatistics(params);
  }
}
