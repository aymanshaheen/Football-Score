import 'package:Goal/src/core/domain/entities/teams.dart';
import 'package:Goal/src/features/league/domain/entities/league_info/league_info.dart';
import 'package:equatable/equatable.dart';

class StatisticsInfo extends Equatable {
  final Team team;
  final Leagueinfo league;
  final Games games;
  final Substitutes substitutes;
  final Shots shots;
  final Goals goals;
  final Passes passes;
  final Tackles tackles;
  final Duels duels;
  final Dribbles dribbles;
  final Fouls fouls;
  final Cards cards;
  final Penalty penalty;

  const StatisticsInfo({
    required this.duels,
    required this.team,
    required this.league,
    required this.games,
    required this.substitutes,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  @override
  List<Object?> get props => [
        team,
        league,
        games,
        substitutes,
        shots,
        goals,
        passes,
        tackles,
        duels,
        dribbles,
        fouls,
        cards,
        penalty
      ];
}

class Games extends Equatable {
  final int appearences;
  final int lineups;
  final int minutes;
  final String position;
  final String rating;

  const Games({
    required this.appearences,
    required this.lineups,
    required this.minutes,
    required this.position,
    required this.rating,
  });

  @override
  List<Object?> get props => [appearences, lineups, minutes, position, rating];
}

class Substitutes extends Equatable {
  final int play;
  final int out;
  final int bench;

  const Substitutes({
    required this.play,
    required this.out,
    required this.bench,
  });

  @override
  List<Object?> get props => [play, out, bench];
}

class Shots extends Equatable {
  final int total;
  final int on;

  const Shots({
    required this.total,
    required this.on,
  });

  @override
  List<Object?> get props => [total, on];
}

class Goals extends Equatable {
  final int total;
  final int assists;
  final int saves;

  const Goals({
    required this.total,
    required this.assists,
    required this.saves,
  });

  @override
  List<Object?> get props => [total, assists, saves];
}

class Passes extends Equatable {
  final int total;
  final int key;
  final int accuracy;

  const Passes({
    required this.total,
    required this.key,
    required this.accuracy,
  });

  @override
  List<Object?> get props => [total, key, accuracy];
}

class Pass extends Equatable {
  final int total;
  final int key;
  final String accuracy;

  const Pass({
    required this.total,
    required this.key,
    required this.accuracy,
  });

  @override
  List<Object?> get props => [total, key, accuracy];
}

class Tackles extends Equatable {
  final int total;
  final int blocks;
  final int interceptions;

  const Tackles({
    required this.total,
    required this.blocks,
    required this.interceptions,
  });

  @override
  List<Object?> get props => [total, blocks, interceptions];
}

class Duels extends Equatable {
  final int total;
  final int won;

  const Duels({
    required this.total,
    required this.won,
  });

  @override
  List<Object?> get props => [total, won];
}

class Dribbles extends Equatable {
  final int attempts;
  final int success;

  const Dribbles({
    required this.attempts,
    required this.success,
  });

  @override
  List<Object?> get props => [attempts, success];
}

class Fouls extends Equatable {
  final int drawn;
  final int committed;

  const Fouls({
    required this.drawn,
    required this.committed,
  });

  @override
  List<Object?> get props => [drawn, committed];
}

class Cards extends Equatable {
  final int yellow;
  final int yellowred;
  final int red;

  const Cards({
    required this.yellow,
    required this.yellowred,
    required this.red,
  });

  @override
  List<Object?> get props => [yellow, yellowred, red];
}

class Penalty extends Equatable {
  final int won;
  final int commited;
  final int scored;
  final int missed;
  final int saved;

  const Penalty({
    required this.won,
    required this.commited,
    required this.scored,
    required this.missed,
    required this.saved,
  });

  @override
  List<Object?> get props => [won, commited, scored, missed, saved];
}
