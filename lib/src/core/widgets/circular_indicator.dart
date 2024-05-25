import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.green,
        animating: true,
        radius: 15,
      ),
    );
  }
}
