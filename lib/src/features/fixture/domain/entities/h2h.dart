import 'package:Goal/src/core/domain/entities/soccer_fixture.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/biggest.dart';
import 'package:Goal/src/features/team/domain/entities/statistics/clean_sheet.dart';
import 'package:equatable/equatable.dart';

class H2H extends Equatable {
  final List<SoccerFixture> h2h;
  final Comparison comparison;
  final TeamsComparison teamsComparison;
  const H2H({
    required this.comparison,
    required this.teamsComparison,
    required this.h2h,
  });
  @override
  List<Object?> get props => [h2h, comparison, teamsComparison];
}

class Goals extends Equatable {
  final int home;
  final int away;

  const Goals({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class TeamsComparison extends Equatable {
  final TeamForm home;
  final TeamForm away;

  const TeamsComparison({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class TeamForm extends Equatable {
  final int id;
  final String name;
  final String logo;
  final Last5 last5;
  final Biggest biggest;
  final CleanSheet cleanSheet;
  final FailedToScore failedToScore;
  final LeagueH2H league;

  const TeamForm({
    required this.id,
    required this.name,
    required this.logo,
    required this.last5,
    required this.biggest,
    required this.cleanSheet,
    required this.league,
    required this.failedToScore,
  });

  @override
  List<Object?> get props =>
      [id, name, logo, last5, biggest, league, cleanSheet, failedToScore];
}

class FailedToScore extends Equatable {
  final int home;
  final int away;
  final int total;

  const FailedToScore({
    required this.home,
    required this.away,
    required this.total,
  });

  @override
  List<Object?> get props => [home, away, total];
}

class Last5 extends Equatable {
  final String form;
  final String att;
  final String def;
  final Goals goals;

  const Last5({
    required this.form,
    required this.att,
    required this.def,
    required this.goals,
  });

  @override
  List<Object?> get props => [form, att, def, goals];
}

class Comparison extends Equatable {
  final Form form;
  final FormGoal formGoal;
  final Att att;
  final Def def;
  final PoissonDistribution poissonDistribution;
  final Head2Head head2head;
  final Total total;

  const Comparison({
    required this.form,
    required this.formGoal,
    required this.att,
    required this.def,
    required this.poissonDistribution,
    required this.head2head,
    required this.total,
  });

  @override
  List<Object?> get props =>
      [form, att, def, poissonDistribution, head2head, total, formGoal];
}

class Form extends Equatable {
  final String home;
  final String away;

  const Form({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class FormGoal extends Equatable {
  final String home;
  final String away;

  const FormGoal({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class Att extends Equatable {
  final String home;
  final String away;

  const Att({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class Def extends Equatable {
  final String home;
  final String away;

  const Def({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class PoissonDistribution extends Equatable {
  final String home;
  final String away;

  const PoissonDistribution({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class Head2Head extends Equatable {
  final String home;
  final String away;

  const Head2Head({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class Total extends Equatable {
  final String home;
  final String away;

  const Total({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [home, away];
}

class LeagueH2H extends Equatable {
  final String form;
  final FixturesH2H fixtures;
  final GoalsH2H goals;
  final Biggest biggest;
  final CleanSheet cleanSheet;
  final FailedToScore failedToScore;

  const LeagueH2H({
    required this.form,
    required this.fixtures,
    required this.goals,
    required this.biggest,
    required this.cleanSheet,
    required this.failedToScore,
  });

  @override
  List<Object?> get props =>
      [form, fixtures, goals, biggest, cleanSheet, failedToScore];
}

class FixturesH2H extends Equatable {
  final Played played;
  final Wins wins;
  final Draws draws;
  final Loses loses;

  const FixturesH2H({
    required this.played,
    required this.wins,
    required this.draws,
    required this.loses,
  });

  @override
  List<Object?> get props => [played, wins, draws, loses];
}

class Played extends Equatable {
  final int home;
  final int away;
  final int total;

  const Played({
    required this.home,
    required this.away,
    required this.total,
  });

  @override
  List<Object?> get props => [home, away, total];
}

class Wins extends Played {
  const Wins({
    required super.home,
    required super.away,
    required super.total,
  });
}

class Draws extends Played {
  const Draws({
    required super.home,
    required super.away,
    required super.total,
  });
}

class Loses extends Played {
  const Loses({
    required super.home,
    required super.away,
    required super.total,
  });
}

class GoalsH2H extends Equatable {
  final For forGoals;
  final Against against;

  const GoalsH2H({
    required this.forGoals,
    required this.against,
  });

  @override
  List<Object?> get props => [forGoals, against];
}

class For extends Equatable {
  final TotalFor total;
  final Average average;

  const For({
    required this.total,
    required this.average,
  });

  @override
  List<Object?> get props => [total, average];
}

class TotalFor extends Played {
  const TotalFor({
    required super.home,
    required super.away,
    required super.total,
  });
}

class Average extends Equatable {
  final String home;
  final String away;
  final String total;

  const Average({
    required this.home,
    required this.away,
    required this.total,
  });

  @override
  List<Object?> get props => [home, away, total];
}

class Against extends For {
  const Against({
    required super.total,
    required super.average,
  });
}
