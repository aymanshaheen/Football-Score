import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';

class PlayerInfoRow extends StatelessWidget {
  final BuildContext context;
  final String value1;
  final String label1;
  final String value2;
  final String label2;
  final String value3;
  final String label3;

  const PlayerInfoRow({
    super.key,
    required this.context,
    required this.value1,
    required this.label1,
    required this.value2,
    required this.label2,
    required this.value3,
    required this.label3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlayerInfoColumn(context: context, value: value1, label: label1),
        PlayerInfoColumn(context: context, value: value2, label: label2),
        PlayerInfoColumn(context: context, value: value3, label: label3),
      ],
    );
  }
}

class PlayerInfoColumn extends StatelessWidget {
  final BuildContext context;
  final String value;
  final String label;

  const PlayerInfoColumn({
    super.key,
    required this.context,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: R.sW(context, 14),
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: R.sW(context, 10),
            fontWeight: FontWeight.w400,
            color: AppColors.white70,
          ),
        ),
      ],
    );
  }
}
