import 'package:Goal/src/features/auth/domain/repository/user_repository.dart';



class GoogleAuthUseCase {
 final UserRepository repository;

  GoogleAuthUseCase({required this.repository});


  Future<void> call() {
    return repository.googleAuth();
  }


}