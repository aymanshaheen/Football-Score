import 'package:equatable/equatable.dart';

class RedCardTopScorers extends Equatable {
  final int red;
  final int yellow;
  final int yellowred;

  const RedCardTopScorers({required this.red, required this.yellow, required this.yellowred});
  
  @override
  List<Object?> get props => [red,yellow,yellowred];
}