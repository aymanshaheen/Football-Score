import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  const ContainerButton({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 44,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          title!,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
