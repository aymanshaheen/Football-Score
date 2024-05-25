import 'package:Goal/src/features/team/domain/entities/statistics/for.dart';

class ForModel extends For {
  const ForModel({
    required super.away,
    required super.home,
  });

  factory ForModel.fromJson(Map<String, dynamic> json) {
    return ForModel(
      away: json["away"],
      home: json["home"],
    );
  }
}
