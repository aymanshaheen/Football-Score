import 'package:equatable/equatable.dart';

class Win extends Equatable {
  const Win({
    required this.away,
    required this.home,
  });

  final String? away;
  final String? home;

  @override
  List<Object?> get props => [
        away,
        home,
      ];
}
