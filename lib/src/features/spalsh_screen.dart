import 'package:Goal/src/core/utils/app_constants.dart';
import 'package:Goal/src/core/utils/app_pref.dart';
import 'package:Goal/src/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AppPreferences? appPreferences;

  @override
  void initState() {
    super.initState();
    initAppPreferences();
  }

  Future<void> initAppPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    appPreferences = AppPreferences(sharedPreferences);
    var token = appPreferences!.getData(key: 'token') ?? '';
    AppConstants.token = (token != '') ? token : '';
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, authState) async {
        // Delay for 3 seconds
        await Future.delayed(const Duration(seconds: 3));

        if (authState is Authenticated) {
          Navigator.pushReplacementNamed(context, Routes.soccerLayout);
        } else {
          Navigator.pushReplacementNamed(context, Routes.login);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.darkgrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/goal.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 200),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Welcome to R2'),
                  ],
                  totalRepeatCount: 2,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
