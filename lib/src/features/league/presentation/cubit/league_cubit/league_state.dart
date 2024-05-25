import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:Goal/src/features/league/domain/entities/top_scorers/league_top_scorers.dart';

abstract class LeagueInfoStates {}

class LeagueInitial extends LeagueInfoStates {}

class LeagueinfoLoading extends LeagueInfoStates {}

class LeagueinfoLoaded extends LeagueInfoStates {
  final LeagueInfo leagueInfo;

  LeagueinfoLoaded(this.leagueInfo);
}

class LeagueinfoLoadFailure extends LeagueInfoStates {
  final String message;

  LeagueinfoLoadFailure(this.message);
}

class TopScorersLoading extends LeagueInfoStates {}

class TopScorersLoaded extends LeagueInfoStates {
  final List<PlayerTopScorers> toplayer;
  TopScorersLoaded(this.toplayer);
}

class TopScorersLoadFailure extends LeagueInfoStates {
  final String message;

  TopScorersLoadFailure(this.message);
}

class TopAsistLoading extends LeagueInfoStates {}

class TopAsistLoaded extends LeagueInfoStates {
  final List<PlayerTopScorers> toplayer;
  TopAsistLoaded(this.toplayer);
}

class TopAsistLoadFailure extends LeagueInfoStates {
  final String message;

  TopAsistLoadFailure(this.message);
}

class TopRedLoading extends LeagueInfoStates {}

class TopRedLoaded extends LeagueInfoStates {
  final List<PlayerTopScorers> toplayer;
  TopRedLoaded(this.toplayer);
}

class TopRedLoadFailure extends LeagueInfoStates {
  final String message;

  TopRedLoadFailure(this.message);
}

class TopYellowLoading extends LeagueInfoStates {}

class TopYellowLoaded extends LeagueInfoStates {
  final List<PlayerTopScorers> toplayer;
  TopYellowLoaded(this.toplayer);
}

class TopYellowLoadFailure extends LeagueInfoStates {
  final String message;

  TopYellowLoadFailure(this.message);
}

class LeagueMatchesLoading extends LeagueInfoStates {}

class LeagueMatchesLoaded extends LeagueInfoStates {
  final List<SoccerFixture> fixtures;
  LeagueMatchesLoaded(this.fixtures);
}

class LeagueMatchesLoadFailure extends LeagueInfoStates {
  final String message;

  LeagueMatchesLoadFailure(this.message);
}
