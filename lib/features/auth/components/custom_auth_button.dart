import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
   const  CustomAuthButton({super.key ,   this.onPressed , required this.text });


   
   final VoidCallback? onPressed; 
   final String text;
  @override
  Widget build(BuildContext context) {
    return     
              ElevatedButton(
                onPressed:  onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor:   AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 60),
                ),
                child: CustomText(
                  text: text,
                  size: 18,
                  color:Colors.white  ,
                  wight: FontWeight.w600,
                ),
              ) ;
  }
}