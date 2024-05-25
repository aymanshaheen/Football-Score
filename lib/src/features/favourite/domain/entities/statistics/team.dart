import 'package:equatable/equatable.dart';
class Team extends Equatable {
  const Team({
    required this.id,
    required this.logo,
    required this.name,
  });

  final int? id;
  final String? logo;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        logo,
        name,
      ];
}
