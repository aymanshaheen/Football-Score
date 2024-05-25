import 'package:Goal/src/features/team/domain/entities/favourite.dart';

class FavouriteModel extends Favourite {
  const FavouriteModel({
    
  required super.id, required super.name, required super.photo});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'photo': photo,
      };

  factory FavouriteModel.fromMap(Map<String, dynamic> map) => FavouriteModel(
        id: map['id'],
        name: map['name'],
        photo: map['photo'],
      );
}
