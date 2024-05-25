import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_size.dart';

ThemeData getAppTheme() => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(179, 29, 28, 28),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: AppColors.white),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(179, 29, 28, 28),
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      
      scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      canvasColor: AppColors.darkgrey,
      primaryColor: AppColors.green,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: FontSize.title,
          fontWeight: FontWeights.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.white,
          fontSize: FontSize.subTitle,
          fontWeight: FontWeights.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: FontSize.subTitle,
          fontWeight: FontWeights.semiBold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: FontSize.bodyText,
          fontWeight: FontWeights.regular,
        ),
        bodySmall: TextStyle(
          color: AppColors.white,
          fontSize: FontSize.details,
          fontWeight: FontWeights.medium,
        ),
      ),
    );
