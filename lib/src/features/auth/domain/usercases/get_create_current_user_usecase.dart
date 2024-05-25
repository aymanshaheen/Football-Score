import 'package:Goal/src/features/auth/domain/entities/user_entity.dart';
import 'package:Goal/src/features/auth/domain/repository/user_repository.dart';

class GetCreateCurrentUserUseCase {
  final UserRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});


  Future<void> call(UserEntity user) {
    return repository.getCreateCurrentUser(user);
  }


}