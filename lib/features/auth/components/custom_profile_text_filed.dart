// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';

class CustomProfileTextFiled extends StatelessWidget {
   CustomProfileTextFiled({super.key , required this.controller , required this.labelText});

 String labelText;
 TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return   TextField(
               controller: controller,
              decoration: InputDecoration(
               labelText: labelText,
               labelStyle: TextStyle(
                color: AppColors.primary
               ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    
                  )
                ),
              ),
             );
  }
}