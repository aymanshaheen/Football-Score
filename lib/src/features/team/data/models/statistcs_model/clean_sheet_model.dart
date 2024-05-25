import 'package:Goal/src/features/team/domain/entities/statistics/clean_sheet.dart';

class CleanSheetModel extends CleanSheet {
  const CleanSheetModel({
    required super.away,
    required super.home,
    required super.total,
  });

  factory CleanSheetModel.fromJson(Map<String, dynamic> json) {
    return CleanSheetModel(
      away: json["away"] ?? 0,
      home: json["home"] ?? 0,
      total: json["total"] ?? 0,
    );
  }
}
