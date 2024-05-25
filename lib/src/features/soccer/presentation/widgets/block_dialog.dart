import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

void buildBlockAlert({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.red,
      dismissDirection: DismissDirection.none,
      padding: EdgeInsets.only(left: R.sW(context, 20)),
      content: Text(message,
          style: TextStyle(color: AppColors.white, fontSize: R.F(context, 12))),
      duration: const Duration(hours: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      action: SnackBarAction(
        label: AppStrings.reload,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(Routes.soccerLayout);
        },
      ),
    ),
  );
}
