import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';
import 'package:Goal/src/features/league/domain/use_case/league_match_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/league_info_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_asistis_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_red_card_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_scorers_use_case.dart';
import 'package:Goal/src/features/league/domain/use_case/top_yellow_card_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'league_state.dart';

class LeagueInfoCubit extends Cubit<LeagueInfoStates> {
  final LeagueInfoUseCase leagueInfoUseCase;
  final TopScorersUseCase topScorersUseCase;
  final TopRedCardsUseCase topRedCardsUseCase;
  final TopAsisitisUseCase topAsisitisUseCase;
  final LeagueMatchesUseCase leagueMatchesUseCase;
  final TopYellowCardsUseCase topYellowCardsUseCase;
  LeagueInfoCubit({
    required this.leagueMatchesUseCase,
    required this.leagueInfoUseCase,
    required this.topScorersUseCase,
    required this.topRedCardsUseCase,
    required this.topAsisitisUseCase,
    required this.topYellowCardsUseCase,
  }) : super(LeagueInitial());

  Future<List<PlayerTopScorers>> getTopScorers(ScorersParams params) async {
    emit(TopScorersLoading());
    final fixtures = await topScorersUseCase(params);
    List<PlayerTopScorers> filtered = [];
    fixtures.fold(
      (left) => emit(TopScorersLoadFailure(left.message)),
      (right) {
        for (PlayerTopScorers top in right) {
          filtered.add(top);
        }
        emit(TopScorersLoaded(filtered));
      },
    );
    return filtered;
  }

  Future<List<PlayerTopScorers>> getTopAsist(AsistsParams params) async {
    emit(TopAsistLoading());
    final fixtures = await topAsisitisUseCase(params);
    List<PlayerTopScorers> filtered = [];
    fixtures.fold(
      (left) => emit(TopAsistLoadFailure(left.message)),
      (right) {
        for (PlayerTopScorers top in right) {
          filtered.add(top);
        }
        emit(TopAsistLoaded(filtered));
      },
    );
    return filtered;
  }

  Future<List<PlayerTopScorers>> getTopRed(RedParams params) async {
    emit(TopRedLoading());
    final fixtures = await topRedCardsUseCase(params);
    List<PlayerTopScorers> filtered = [];
    fixtures.fold(
      (left) => emit(TopRedLoadFailure(left.message)),
      (right) {
        for (PlayerTopScorers top in right) {
          filtered.add(top);
        }
        emit(TopRedLoaded(filtered));
      },
    );
    return filtered;
  }

  Future<List<PlayerTopScorers>> getTopYellow(YellowParams params) async {
    emit(TopYellowLoading());
    final fixtures = await topYellowCardsUseCase(params);
    List<PlayerTopScorers> filtered = [];
    fixtures.fold(
      (left) => emit(TopYellowLoadFailure(left.message)),
      (right) {
        for (PlayerTopScorers top in right) {
          filtered.add(top);
        }
        emit(TopYellowLoaded(filtered));
      },
    );
    return filtered;
  }

  Future<List<SoccerFixture>> getLeagueMatches(
      LeagueMatchesParameter params) async {
    emit(LeagueMatchesLoading());
    final fixtures = await leagueMatchesUseCase(params);
    List<SoccerFixture> filteredFixtures = [];
    fixtures.fold(
      (left) => emit(LeagueMatchesLoadFailure(left.message)),
      (right) {
        for (SoccerFixture match in right) {
          if (AppConstants.availableLeagues.contains(match.fixtureLeague.id)) {
            filteredFixtures.add(match);
          }
        }
        emit(LeagueMatchesLoaded(filteredFixtures));
      },
    );
    return filteredFixtures;
  }
}
