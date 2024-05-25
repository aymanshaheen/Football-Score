

import 'package:Goal/src/container_injector.dart';
import 'package:Goal/src/features/auth/data/remote_data_source/user_remote_data_source.dart';
import 'package:Goal/src/features/auth/data/remote_data_source/user_remote_data_source_impl.dart';
import 'package:Goal/src/features/auth/data/repository/user_repository_impl.dart';
import 'package:Goal/src/features/auth/domain/repository/user_repository.dart';
import 'package:Goal/src/features/auth/domain/usercases/forgot_password_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/get_create_current_user_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/get_current_uid_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/get_single_user_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/get_update_user_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/google_auth_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/is_sign_in_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/sign_in_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/sign_out_usecase.dart';
import 'package:Goal/src/features/auth/domain/usercases/sign_up_usecase.dart';
import 'package:Goal/src/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:Goal/src/features/auth/presentation/cubit/credential/credential_cubit.dart';
import 'package:Goal/src/features/auth/presentation/cubit/single_user/single_user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> userInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUIDUseCase: sl.call()));

  sl.registerFactory<SingleUserCubit>(
      () => SingleUserCubit(getSingleUserUseCase: sl.call()));
    sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseStorage.instance);

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      forgotPasswordUseCase: sl.call(),
      googleAuthUseCase: sl.call(),
      signInUseCase: sl.call(),
      signUpUseCase: sl.call()));

  //UseCases
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIDUseCase>(
      () => GetCurrentUIDUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetSingleUserUseCase>(
      () => GetSingleUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUpdateUserUseCase>(
      () => GetUpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));

  //Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  // RemoteDataSource

  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      fireStore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));
}
