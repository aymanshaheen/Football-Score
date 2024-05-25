import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/league/domain/repositories/league_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/usecase/usecase.dart';

class LeagueInfoUseCase implements UseCase<LeagueInfo, int> {
  final LeagueRepository leagueRepository;

  LeagueInfoUseCase({required this.leagueRepository});

  @override
  Future<Either<Failure, LeagueInfo>> call(int league) async {
    return await leagueRepository.getLeagueInfo(league: league);
  }
}
