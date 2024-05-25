import 'dart:io';

import 'package:Goal/src/features/auth/domain/entities/user_entity.dart';
import 'package:Goal/src/features/auth/domain/usercases/get_single_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_user_state.dart';

class SingleUserCubit extends Cubit<SingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  SingleUserCubit({required this.getSingleUserUseCase}) : super(SingleUserInitial());

  Future<void> getSingleUserProfile({required UserEntity user})async{
    emit(SingleUserLoading());
    try{
      final streamResponse= getSingleUserUseCase.call(user);
      streamResponse.listen((user) {
        emit(SingleUserLoaded(currentUser: user.first));
      });
    }on SocketException catch(_){
      emit(SingleUserFailure());
    }catch(_){
      emit(SingleUserFailure());
    }
  }
}
