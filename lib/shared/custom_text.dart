import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   const CustomText( {super.key ,
    required this.text,
    this.size,
     this.color,
     this.wight,
     this.fontFamily = 'Poppins',
  });

  final String text ;
  final double? size;
  final Color? color;
  final FontWeight? wight;
  final  String? fontFamily ; 
  
  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        overflow: TextOverflow.ellipsis ,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: wight,
          fontFamily: fontFamily,
        ),
    );
  }
}