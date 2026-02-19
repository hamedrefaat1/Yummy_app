// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';

class CustomTextform extends StatefulWidget {
   CustomTextform({
    super.key,
    required this.controller,
    required this.isPassword,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final IconData? prefixIcon;
   bool  obscureText ;

  @override
  State<CustomTextform> createState() => _CustomTextformState();
}

class _CustomTextformState extends State<CustomTextform> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary , width: 1.2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary , width: 1.2),
        ),

        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(widget.prefixIcon, color: Colors.grey),

        suffixIcon: widget.isPassword
            ? visibility
                  ? GestureDetector(
                      onTap: () {
                         setState(() {
                          visibility = !visibility;
                          widget.obscureText = false;
                        });
                      },
                      child: Icon(Icons.visibility, color: Colors.grey),
                    )
                  : GestureDetector(
                    onTap:(){
                        setState(() {
                          visibility = !visibility;
                          widget.obscureText = true;
                        });
                    },
                    child: Icon(Icons.visibility_off, color: Colors.grey))
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return  'Please fiil ${widget.hintText}';
        }
        return null;
      },
    );
  }
}
