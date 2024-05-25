import '../../domain/entities/player.dart';

class PlayerLiModel extends PlayerLi {
  const PlayerLiModel(
      {required super.id,
      required super.name,
      required super.number,
      required super.grid,
      required super.pos});

  factory PlayerLiModel.fromJson(Map<String, dynamic> json) => PlayerLiModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        number: json["number"] ?? 0,
        pos: json["pos"] ?? "NF",
        grid: json["grid"] ?? "-1",
      );
}
