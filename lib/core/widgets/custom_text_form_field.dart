import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget customField({
  required String? text,
  required IconData? prefixIcon,
  IconData? sufIcon,
  void Function()? onPressed,
  Color? color=AppColors.primaryColor,
  required String? Function(String?) validator,
  required TextEditingController controller,
  bool obscureText=false,
}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color:Colors.grey.withOpacity(0.2),
    ),
    child: TextFormField(
      cursorColor: AppColors.primaryColor,
      controller: controller,
      validator:  validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        prefixIcon:Icon(prefixIcon,color: color,),
        suffixIcon: IconButton(onPressed: onPressed,
          icon: Icon(sufIcon,color: color),
        ),
        hintText:"$text",
        hintStyle: TextStyle(
          color: color,
          fontSize: 15,
        ),
      ),
    ),
  );
}