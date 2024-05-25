import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/widgets.dart';

class CircularImageBuilder extends StatelessWidget {
  const CircularImageBuilder({
    super.key,
    required this.photo,
    required this.height,
    required this.width,
  });

  final String photo;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: R.sW(context, width),
      height: R.sH(context, height),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkgrey,
        image: DecorationImage(
          image: NetworkImage(
            photo,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
