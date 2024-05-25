import 'package:Goal/src/features/team/domain/entities/statistics/win.dart';

class WinModel extends Win {
  const WinModel({
    required super.away,
    required super.home,
  });

  factory WinModel.fromJson(Map<String, dynamic> json) {
    return WinModel(
      away: json["away"],
      home: json["home"],
    );
  }
}
