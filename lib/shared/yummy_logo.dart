

import 'package:flutter/material.dart';

class YummyLogo extends StatelessWidget {
  const YummyLogo({super.key , this.color = Colors.white , this.fontSize =70});

   final Color color ;
   final double fontSize ;

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Yummy!',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: 'Poppins',
        letterSpacing: 1.5,
      ),
    );
  }
}