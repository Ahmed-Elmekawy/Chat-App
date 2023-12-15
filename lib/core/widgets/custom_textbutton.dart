import 'package:chat_app/core/functions/navigation.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

GestureDetector customTextButton(BuildContext context,{required Widget widget,required String text}) {
  return GestureDetector(
      onTap: () {
        navigateTo(context,widget);
      },
      child: Text(text,
        style: const TextStyle(
            fontSize: 13, color: AppColors.primaryColor),
      ));
}