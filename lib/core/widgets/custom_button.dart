import 'package:flutter/material.dart';

Widget customButton({
  required void Function()? onPressed,
  required Color? colorText,
  required String? text,
  required Color? buttonColor,
  double? width=120,
}){
  return Container(
    height: 40,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: buttonColor,
    ),
    child: MaterialButton(
      onPressed:onPressed,
      child: Text("$text",
        style: TextStyle(
          color: colorText,
          fontSize: 15,
        ),
      ),
    ),
  );
}

