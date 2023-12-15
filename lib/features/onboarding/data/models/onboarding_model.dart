import 'package:flutter/material.dart';

class BoardingModel {
  String image;
  double height;
  String title;
  String description;
  Widget Function(BuildContext context) button;

  BoardingModel({
    required this.image,
    required this.height,
    required this.title,
    required this.description,
    required this.button,
  });
}
