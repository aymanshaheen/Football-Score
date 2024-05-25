import 'package:Goal/src/features/auth/domain/entities/user_entity.dart';
import 'package:Goal/src/features/auth/domain/repository/user_repository.dart';

class GetSingleUserUseCase{
  final UserRepository repository;

  GetSingleUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity user){
    return repository.getSingleUser(user);
  }
}