import 'package:Goal/src/core/domain/entities/league.dart';
import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/use_case/league_match_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_asistis_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_red_card_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_scorers_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_yellow_card_use_case.dart';
import 'package:Goal/src/features/league/presentation/cubit/league_cubit/league_cubit.dart';
import 'package:Goal/src/features/soccer/domain/use_cases/standings_usecase.dart';
import 'package:Goal/src/features/team/presentation/cubit/team_cubit/team_cubit.dart';

class LeagueService {
  final LeagueInfoCubit leagueInfoCubit;
  final TeamCubit teamCubit;
  List<SoccerFixture> leagueMatches = [];
  List<PlayerTopScorers> topGoals = [];
  List<PlayerTopScorers> topAsists = [];
  List<PlayerTopScorers> topRedCards = [];
  List<PlayerTopScorers> topYellowCards = [];

  LeagueService({
    required this.teamCubit,
    required this.leagueInfoCubit,
  });

  Future<void> getLists({required League league}) async {
    LeagueMatchesParameter leagueMatchesParameter = LeagueMatchesParameter(
      leagueId: league.id.toString(),
      season: league.year.toString(),
    );
    StandingsParams standingsParams = StandingsParams(
        leagueId: league.id.toString(), season: league.year.toString());
    ScorersParams scorersParams =
        ScorersParams(leagueId: league.id, season: league.year);
    AsistsParams asistsParams =
        AsistsParams(leagueId: league.id, season: league.year);
    RedParams redParams = RedParams(leagueId: league.id, season: league.year);
    YellowParams yellowParams =
        YellowParams(leagueId: league.id, season: league.year);
    await teamCubit.getStandings(standingsParams);
    leagueMatches =
        await leagueInfoCubit.getLeagueMatches(leagueMatchesParameter);
    topGoals = await leagueInfoCubit.getTopScorers(scorersParams);
    topAsists = await leagueInfoCubit.getTopAsist(asistsParams);
    topRedCards = await leagueInfoCubit.getTopRed(redParams);
    topYellowCards = await leagueInfoCubit.getTopYellow(yellowParams);
  }
}
