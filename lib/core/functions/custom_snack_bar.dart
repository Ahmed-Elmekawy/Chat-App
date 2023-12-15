import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: AppColors.primaryColor,
    ),
  );
}
