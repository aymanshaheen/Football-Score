import 'package:Goal/src/features/team/domain/entities/statistics/loses.dart';

class LosesModel extends Loses {
  const LosesModel({
    required super.away,
    required super.home,
  });

  factory LosesModel.fromJson(Map<String, dynamic> json) {
    return LosesModel(
      away: json["away"],
      home: json["home"],
    );
  }
}
