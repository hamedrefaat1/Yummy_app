import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/shared/custom_text.dart';
import 'package:yummy/shared/yummy_logo.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YummyLogo(color: AppColors.primary, fontSize: 40),
                      CustomText(
                        text: "Hello Hamed!",
                        size: 16,
                        color: Colors.black54,
                        wight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(radius: 25 , backgroundColor: AppColors.primary, child: Icon(Icons.person , color:  Colors.white,), ),
                ],
              );
  }
}