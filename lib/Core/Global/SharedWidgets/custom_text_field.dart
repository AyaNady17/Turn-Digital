import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/Helpers/extensions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String prefixIconPath;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    required this.prefixIconPath,
    this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4DFDF), width: 1),
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.font14GreyWeight400,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.prefixIconPath, width: 24, height: 24),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          suffixIcon:
              widget.isPassword
                  ? InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Image.asset(
                      'assets/images/Hidden.png',
                      width: 24,
                      height: 24,
                    ),
                  ).paddingAll(16)
                  : null,
        ),
      ),
    );
  }
}
