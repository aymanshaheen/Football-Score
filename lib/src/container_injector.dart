import 'package:Goal/src/core/utils/app_pref.dart';
import 'package:Goal/src/features/auth/user_injection_container.dart';
import 'package:Goal/src/features/favourite/favourite_injector.dart';
import 'package:Goal/src/features/league/league_injector.dart';
import 'package:Goal/src/features/player/player_injector.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:Goal/src/features/team/team_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/dio_helper.dart';
import 'core/api/interceptors.dart';
import 'core/network/network_info.dart';
import 'features/fixture/fixture_injector.dart';
import 'features/soccer/soccer_injector.dart';

final sl = GetIt.instance;

Future<void> initApp() async {
  initCore();
  userInjectionContainer();
  initSoccer();
  initFixture();
  initTeam();
  initLeague();
  initPlayer();
  initFavourite();
}

Future<void> initCore() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));



  sl.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  sl.registerLazySingleton<DioHelper>(() => DioHelper(dio: sl<Dio>()));
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  sl.registerLazySingleton<NetworkInfoImpl>(
    () => NetworkInfoImpl(connectionChecker: sl<InternetConnectionChecker>()),
  );


}
