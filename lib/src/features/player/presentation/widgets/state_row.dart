import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {
  final String label;
  final String? value;

  const StatRow({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: R.sH(context, 5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: R.sW(context, 14),
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          Text(
            value ?? '',
            style: TextStyle(
              fontSize: R.sW(context, 14),
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
