import 'package:Goal/src/core/widgets/responsivity.dart';
import 'package:flutter/material.dart';

class StatisticRow extends StatelessWidget {
  final String title;
  final String value;

  const StatisticRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: R.sH(context, 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
      ],
    );
  }
}
