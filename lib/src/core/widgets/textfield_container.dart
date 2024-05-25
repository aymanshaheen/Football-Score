import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final bool? isObscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  const TextFieldContainer(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.isObscureText,
      this.keyboardType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.darkgrey, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        obscureText: isObscureText == true ? true : false,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon ?? Icons.circle),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
