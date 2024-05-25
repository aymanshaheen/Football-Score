
import 'package:Goal/src/features/auth/domain/repository/user_repository.dart';
class GetCurrentUIDUseCase{
  final UserRepository repository;

  GetCurrentUIDUseCase({required this.repository});
  Future<String> call()async{
    return await repository.getCurrentUId();
  }
}