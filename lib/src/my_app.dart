import 'package:Goal/src/container_injector.dart';
import 'package:Goal/src/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:Goal/src/features/auth/presentation/cubit/credential/credential_cubit.dart';
import 'package:Goal/src/features/auth/presentation/cubit/single_user/single_user_cubit.dart';
import 'package:Goal/src/features/soccer/presentation/cubit/soccer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_route.dart';
import 'config/app_theme.dart';
import 'core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SoccerCubit>(
          create: (context) => sl<SoccerCubit>(),
        ),
        BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => sl<CredentialCubit>()),
        BlocProvider<SingleUserCubit>(create: (_) => sl<SingleUserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: AppRouter.routesGenerator,
        title: AppStrings.appName,
        theme: getAppTheme(),
      ),
    );
  }
}
