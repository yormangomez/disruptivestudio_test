import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.hintStyle,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(
              color: AppColors.lyricsBlack,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.ibmPlexSansRegular,
            ),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      focusNode: focusNode,
      onChanged: onChanged,
    );
  }
}
