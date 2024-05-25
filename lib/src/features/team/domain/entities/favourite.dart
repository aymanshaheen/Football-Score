import 'package:equatable/equatable.dart';

class Favourite extends Equatable {
  final String id;
  final String name;
  final String photo;


  const Favourite({
    required this.id,
    required this.name,
    required this.photo,
  });
 
  @override
  List<Object> get props => [id, name, photo];
}