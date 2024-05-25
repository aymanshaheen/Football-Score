import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/features/soccer/domain/use_cases/standings_usecase.dart';
import 'package:Goal/src/features/team/domain/use_cases/last_matches_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/next_match_use_case.dart';
import 'package:Goal/src/features/team/domain/use_cases/statistics_use_case.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';

class TeamService {
  final TeamCubit teamCubit;

  TeamService({required this.teamCubit});

  Future<void> getLists({
    required Team team,
    required SoccerFixture soccerFixture,
  }) async {
    StatisticsParams statisticsParams = StatisticsParams(
        teamId: team.id.toString(),
        leagueId: soccerFixture.fixtureLeague.id.toString(),
        season: soccerFixture.fixtureLeague.season.toString());
    LastMatchesParams lastMatchesParams = LastMatchesParams(
        teamId: team.id.toString(),
        last: 50,
        season: soccerFixture.fixtureLeague.season.toString());
    NextMatchesParams nextMatchesParams = NextMatchesParams(
        teamId: team.id.toString(),
        next: 50,
        season: soccerFixture.fixtureLeague.season.toString());
    NextMatchesParams nextMatchParams = NextMatchesParams(
        teamId: team.id.toString(),
        next: 1,
        season: soccerFixture.fixtureLeague.season.toString());
    StandingsParams standingsParams = StandingsParams(
        leagueId: soccerFixture.fixtureLeague.id.toString(),
        season: soccerFixture.fixtureLeague.season.toString());
    await Future.wait([
      teamCubit.getStatistics(statisticsParams),
      teamCubit.getNextMatches(nextMatchParams),
      teamCubit.getStandings(standingsParams),
      teamCubit.getLastMatches(lastMatchesParams),
      teamCubit.getNextMatches(nextMatchesParams),
      teamCubit.getPlayerSquad(team.id),
    ]);
  }
}
