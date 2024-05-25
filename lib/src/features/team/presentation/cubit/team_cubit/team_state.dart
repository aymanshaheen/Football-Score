import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/features/soccer/domain/entities/standings.dart';
import 'package:Goal/src/features/team/domain/entities/player_squad/team_squad.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/statistics.dart';

abstract class TeamStates {}

class TeamInitial extends TeamStates {}

class TeamStatisticsLoading extends TeamStates {}

class TeamStatisticsLoaded extends TeamStates {
  final TeamStatistics teamStatistics;

  TeamStatisticsLoaded(this.teamStatistics);
}

class TeamStatisticsLoadFailure extends TeamStates {
  final String message;

  TeamStatisticsLoadFailure(this.message);
}

class LastMatchesLoading extends TeamStates {}

class LastMatchesLoaded extends TeamStates {
  final List<SoccerFixture> lastMatches;
  LastMatchesLoaded(this.lastMatches);
}

class LastMatchesLoadFailure extends TeamStates {
  final String message;

  LastMatchesLoadFailure(this.message);
}

class NextMatchesLoading extends TeamStates {}

class NextMatchesLoaded extends TeamStates {
  final List<SoccerFixture> nextMatches;
  NextMatchesLoaded(this.nextMatches);
}

class NextMatchesLoadFailure extends TeamStates {
  final String message;

  NextMatchesLoadFailure(this.message);
}

class SoccerStandingsLoading extends TeamStates {}

class SoccerStandingsLoaded extends TeamStates {
  final Standings standings;

  SoccerStandingsLoaded(this.standings);
}

class SoccerStandingsLoadFailure extends TeamStates {
  final String message;

  SoccerStandingsLoadFailure(this.message);
}

class PlayerSquadLoading extends TeamStates {}

class PlayerSquadLoaded extends TeamStates {
  final TeamSquad teamSquad;
  PlayerSquadLoaded(this.teamSquad);
}

class PlayerSquadLoadFailure extends TeamStates {
  final String message;

  PlayerSquadLoadFailure(this.message);
}

class AddFavouriteLoading extends TeamStates {}

class AddFavouriteLoaded extends TeamStates {
  AddFavouriteLoaded();
}

class AddFavouriteFailure extends TeamStates {
  final String message;

  AddFavouriteFailure(this.message);
}

class DeleteFavouriteLoading extends TeamStates {}

class DeleteFavouriteLoaded extends TeamStates {
  DeleteFavouriteLoaded();
}

class DeleteFavouriteFailure extends TeamStates {
  final String message;

  DeleteFavouriteFailure(this.message);
}
