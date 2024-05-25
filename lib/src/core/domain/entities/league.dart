import 'package:equatable/equatable.dart';

class League extends Equatable {
  final int id;
  final String name;
  final String type;
  final String logo;
  final int year;
   bool isTapped;
   League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
    required this.year,
    this.isTapped = true,

  });

  @override
  List<Object?> get props => [id, name, type, logo, year];
}
