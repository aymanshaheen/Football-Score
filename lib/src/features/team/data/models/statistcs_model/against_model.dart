import 'package:Goal/src/features/team/domain/entities/statistics/against.dart';

class AgainstModel extends Against {
  const AgainstModel({
    required super.away,
    required super.home,
  });

  factory AgainstModel.fromJson(Map<String, dynamic> json) {
    return AgainstModel(
      away: json["away"],
      home: json["home"],
    );
  }
}
