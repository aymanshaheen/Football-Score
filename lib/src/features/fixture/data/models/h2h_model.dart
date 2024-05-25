import 'package:Goal/src/core/models/soccer_fixture_model.dart';
import 'package:Goal/src/features/fixture/domain/entities/h2h.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/biggest_model.dart';
import 'package:Goal/src/features/team/data/models/statistcs_model/clean_sheet_model.dart';

class H2HModel extends H2H {
  const H2HModel({
    required List<SoccerFixtureModel> h2h,
    required ComparisonModel comparison,
    required TeamsComparisonModel teamsComparison,
  }) : super(
          h2h: h2h,
          comparison: comparison,
          teamsComparison: teamsComparison,
        );

  factory H2HModel.fromJson(Map<String, dynamic> json) {
    return H2HModel(
      h2h: (json['h2h'] as List)
          .map((i) => SoccerFixtureModel.fromJson(i))
          .toList(),
      comparison: ComparisonModel.fromJson(json['comparison']),
      teamsComparison: TeamsComparisonModel.fromJson(json['teams']),
    );
  }
}

class GoalsModel extends Goals {
  const GoalsModel({int? home, int? away})
      : super(home: home ?? 0, away: away ?? 0);

  factory GoalsModel.fromJson(Map<String, dynamic> json) {
    return GoalsModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
    );
  }
}

class TeamsComparisonModel extends TeamsComparison {
  const TeamsComparisonModel({
    required TeamFormModel home,
    required TeamFormModel away,
  }) : super(home: home, away: away);

  factory TeamsComparisonModel.fromJson(Map<String, dynamic> json) {
    return TeamsComparisonModel(
      home: TeamFormModel.fromJson(json['home']),
      away: TeamFormModel.fromJson(json['away']),
    );
  }
}

class TeamFormModel extends TeamForm {
  const TeamFormModel({
    required super.id,
    required super.league,
    required super.name,
    required super.logo,
    required Last5Model super.last5,
    required super.biggest,
    required super.cleanSheet,
    required FailedToScoreModel super.failedToScore,
  });

  factory TeamFormModel.fromJson(Map<String, dynamic> json) {
    return TeamFormModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      league: LeagueH2HModel.fromJson(json['league'] ?? {}),
      last5: Last5Model.fromJson(json['last5'] ?? {}),
      biggest: BiggestModel.fromJson(json['biggest'] ?? {}),
      cleanSheet: CleanSheetModel.fromJson(json['cleanSheet'] ?? {}),
      failedToScore: FailedToScoreModel.fromJson(json['failedToScore'] ?? {}),
    );
  }
}

class FailedToScoreModel extends FailedToScore {
  const FailedToScoreModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory FailedToScoreModel.fromJson(Map<String, dynamic> json) {
    return FailedToScoreModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class Last5Model extends Last5 {
  const Last5Model({
    required super.form,
    required super.att,
    required super.def,
    required GoalsModel super.goals,
  });

  factory Last5Model.fromJson(Map<String, dynamic> json) {
    return Last5Model(
      form: json['form'] ?? '',
      att: json['att'] ?? '',
      def: json['def'] ?? '',
      goals: GoalsModel.fromJson(json['goals'] ?? {}),
    );
  }
}

class ComparisonModel extends Comparison {
  const ComparisonModel({
    required FormModel super.form,
    required FormGoalModel super.formGoal,
    required AttModel super.att,
    required DefModel super.def,
    required PoissonDistributionModel super.poissonDistribution,
    required super.head2head,
    required TotalModel super.total,
  });

  factory ComparisonModel.fromJson(Map<String, dynamic> json) {
    return ComparisonModel(
      form: FormModel.fromJson(json['form'] ?? {}),
      formGoal: FormGoalModel.fromJson(json['form_goal'] ?? {}),
      att: AttModel.fromJson(json['att'] ?? {}),
      def: DefModel.fromJson(json['def'] ?? {}),
      poissonDistribution:
          PoissonDistributionModel.fromJson(json['poisson_distribution'] ?? {}),
      head2head: Head2HeadModel.fromJson(json['h2h'] ?? {}),
      total: TotalModel.fromJson(json['total'] ?? {}),
    );
  }
}

class FormModel extends Form {
  const FormModel({
    required super.home,
    required super.away,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class FormGoalModel extends FormGoal {
  const FormGoalModel({
    required super.home,
    required super.away,
  });

  factory FormGoalModel.fromJson(Map<String, dynamic> json) {
    return FormGoalModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class AttModel extends Att {
  const AttModel({
    required super.home,
    required super.away,
  });

  factory AttModel.fromJson(Map<String, dynamic> json) {
    return AttModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class DefModel extends Def {
  const DefModel({
    required super.home,
    required super.away,
  });

  factory DefModel.fromJson(Map<String, dynamic> json) {
    return DefModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class PoissonDistributionModel extends PoissonDistribution {
  const PoissonDistributionModel({
    required super.home,
    required super.away,
  });

  factory PoissonDistributionModel.fromJson(Map<String, dynamic> json) {
    return PoissonDistributionModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class Head2HeadModel extends Head2Head {
  const Head2HeadModel({
    required super.home,
    required super.away,
  });

  factory Head2HeadModel.fromJson(Map<String, dynamic> json) {
    return Head2HeadModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class TotalModel extends Total {
  const TotalModel({
    required super.home,
    required super.away,
  });

  factory TotalModel.fromJson(Map<String, dynamic> json) {
    return TotalModel(
      home: json['home'] ?? "20%",
      away: json['away'] ?? "20%",
    );
  }
}

class LeagueH2HModel extends LeagueH2H {
  const LeagueH2HModel({
    required super.form,
    required FixturesH2HModel super.fixtures,
    required GoalsH2HModel super.goals,
    required BiggestModel super.biggest,
    required CleanSheetModel super.cleanSheet,
    required FailedToScoreModel super.failedToScore,
  });

  factory LeagueH2HModel.fromJson(Map<String, dynamic> json) {
    return LeagueH2HModel(
      form: json['form'] ?? '',
      fixtures: FixturesH2HModel.fromJson(json['fixtures'] ?? {}),
      goals: GoalsH2HModel.fromJson(json['goals'] ?? {}),
      biggest: BiggestModel.fromJson(json['biggest'] ?? {}),
      cleanSheet: CleanSheetModel.fromJson(json['clean_sheet'] ?? {}),
      failedToScore: FailedToScoreModel.fromJson(json['failed_to_score'] ?? {}),
    );
  }
}

class FixturesH2HModel extends FixturesH2H {
  const FixturesH2HModel({
    required PlayedModel played,
    required WinsModel wins,
    required DrawsModel draws,
    required LosesModel loses,
  }) : super(played: played, wins: wins, draws: draws, loses: loses);

  factory FixturesH2HModel.fromJson(Map<String, dynamic> json) {
    return FixturesH2HModel(
      played: PlayedModel.fromJson(json['played'] ?? {}),
      wins: WinsModel.fromJson(json['wins'] ?? {}),
      draws: DrawsModel.fromJson(json['draws'] ?? {}),
      loses: LosesModel.fromJson(json['loses'] ?? {}),
    );
  }
}

class PlayedModel extends Played {
  const PlayedModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory PlayedModel.fromJson(Map<String, dynamic> json) {
    return PlayedModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class WinsModel extends Wins {
  const WinsModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory WinsModel.fromJson(Map<String, dynamic> json) {
    return WinsModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class DrawsModel extends Draws {
  const DrawsModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory DrawsModel.fromJson(Map<String, dynamic> json) {
    return DrawsModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class LosesModel extends Loses {
  const LosesModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory LosesModel.fromJson(Map<String, dynamic> json) {
    return LosesModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class GoalsH2HModel extends GoalsH2H {
  const GoalsH2HModel({
    required ForModel forGoals,
    required AgainstModel against,
  }) : super(forGoals: forGoals, against: against);

  factory GoalsH2HModel.fromJson(Map<String, dynamic> json) {
    return GoalsH2HModel(
      forGoals: ForModel.fromJson(json['for'] ?? {}),
      against: AgainstModel.fromJson(json['against'] ?? {}),
    );
  }
}

class ForModel extends For {
  const ForModel({
    required TotalForModel total,
    required AverageModel average,
  }) : super(total: total, average: average);

  factory ForModel.fromJson(Map<String, dynamic> json) {
    return ForModel(
      total: TotalForModel.fromJson(json['total'] ?? {}),
      average: AverageModel.fromJson(json['average'] ?? {}),
    );
  }
}

class TotalForModel extends TotalFor {
  const TotalForModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory TotalForModel.fromJson(Map<String, dynamic> json) {
    return TotalForModel(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class AverageModel extends Average {
  const AverageModel({
    required super.home,
    required super.away,
    required super.total,
  });

  factory AverageModel.fromJson(Map<String, dynamic> json) {
    return AverageModel(
      home: json['home'] ?? '0',
      away: json['away'] ?? '0',
      total: json['total'] ?? '0',
    );
  }
}

class AgainstModel extends Against {
  const AgainstModel({
    required TotalForModel total,
    required AverageModel average,
  }) : super(total: total, average: average);

  factory AgainstModel.fromJson(Map<String, dynamic> json) {
    return AgainstModel(
      total: TotalForModel.fromJson(json['total'] ?? {}),
      average: AverageModel.fromJson(json['average'] ?? {}),
    );
  }
}
