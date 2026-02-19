import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,  this.onPressed, required this.text});


final VoidCallback? onPressed ;
final String text ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: onPressed,
      child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                     
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primary,
                      ),
                      child: CustomText(text: text , size: 16, wight: FontWeight.w600, color: Colors.white,),
                    ),
                  ),
    );
  }
}