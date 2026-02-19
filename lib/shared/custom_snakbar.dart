import 'package:flutter/material.dart';
import 'package:yummy/shared/custom_text.dart';

SnackBar customSnakbar(message, color) {
  return SnackBar(
    content: CustomText(text: message),
    backgroundColor: color,
  );
}
