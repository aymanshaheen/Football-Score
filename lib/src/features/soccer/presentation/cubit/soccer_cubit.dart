import 'package:Goal/src/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:Goal/src/features/soccer/presentation/screens/leagues_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/entities/league.dart';
import '../../../../core/domain/entities/soccer_fixture.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/app_constants.dart';
import '../../domain/entities/league_of_fixture.dart';
import '../../domain/use_cases/day_fixtures_usecase.dart';
import '../../domain/use_cases/leagues_usecase.dart';
import '../../domain/use_cases/live_fixtures_usecase.dart';
import '../screens/soccer_screen.dart';
import 'soccer_state.dart';

class SoccerCubit extends Cubit<SoccerStates> {
  final DayFixturesUseCase dayFixturesUseCase;
  final LeaguesUseCase leaguesUseCase;
  final LiveFixturesUseCase liveFixturesUseCase;

  SoccerCubit({
    required this.dayFixturesUseCase,
    required this.leaguesUseCase,
    required this.liveFixturesUseCase,
  }) : super(ScoreInitial());
 static SoccerCubit get(context) => BlocProvider.of<SoccerCubit>(context);

  List screens = [
    const SoccerScreen(),
    const AllLeaguesScreen(),
    const FavouriteScreen(),
    const FavouriteScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SoccerChangeBottomNav());
  }

  List<League> filteredLeagues = [];

  List<League> allLeagues = []; 

  Future<List<League>> getLeagues() async {
    emit(SoccerLeaguesLoading());
    filteredLeagues = [];
    final leagues = await leaguesUseCase(NoParams());
    leagues.fold(
      (left) => emit(SoccerLeaguesLoadFailure(left.message)),
      (right) {
        allLeagues = right; 
        filteredLeagues = List.from(allLeagues);
        for (League league in right) {
          AppConstants.leaguesFixtures
              .putIfAbsent(league.id, () => LeagueOfFixture(league: league));
        }
        emit(SoccerLeaguesLoaded(filteredLeagues));
      },
    );
    return filteredLeagues;
  }

 void searchLeagues(String searchTerm) {
  if (searchTerm.isEmpty) {
    filteredLeagues = allLeagues;
  } else {
    filteredLeagues = allLeagues
        .where((league) => league.name.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
  emit(SoccerLeaguesLoaded(filteredLeagues));
}

  List<SoccerFixture> dayFixtures = [];

  Future<List<SoccerFixture>> getFixtures(String date) async {
    emit(SoccerFixturesLoading());
    final fixtures = await dayFixturesUseCase(date);
    List<SoccerFixture> filteredFixtures = [];
    fixtures.fold(
      (left) => emit(SoccerFixturesLoadFailure(left.message)),
      (right) {
        AppConstants.leaguesFixtures.forEach((key, value) {
          value.fixtures.clear();
        });
        AppConstants.leaguesList.clear();
        for (SoccerFixture fixture in right) {
          if (AppConstants.availableLeagues
              .contains(fixture.fixtureLeague.id)) {
            filteredFixtures.add(fixture);
            AppConstants.leaguesFixtures[fixture.fixtureLeague.id]!.fixtures
                .add(fixture);
            if (!AppConstants.leaguesList.contains(fixture.fixtureLeague.id)) {
              AppConstants.leaguesList.add(fixture.fixtureLeague.id);
            }
          }
          dayFixtures = filteredFixtures;
        }
        emit(SoccerFixturesLoaded(filteredFixtures));
      },
    );
    return filteredFixtures;
  }

  Future<List<SoccerFixture>> getLiveFixtures() async {
    emit(SoccerFixturesLoading());
    final liveFixtures = await liveFixturesUseCase(NoParams());
    List<SoccerFixture> filteredFixtures = [];
    liveFixtures.fold(
      (left) => emit(SoccerLiveFixturesLoadFailure(left.message)),
      (right) {
        filteredFixtures = right
            .where((fixture) => AppConstants.availableLeagues
                .contains(fixture.fixtureLeague.id))
            .toList();
        emit(SoccerLiveFixturesLoaded(filteredFixtures));
      },
    );
    return filteredFixtures;
  }

  List<SoccerFixture> currentFixtures = [];

  loadCurrentFixtures(int leagueId) {
    currentFixtures = AppConstants.leaguesFixtures[leagueId]?.fixtures ?? [];
    emit(SoccerCurrentFixturesChanges());
  }
}
