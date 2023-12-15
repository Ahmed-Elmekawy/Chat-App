import 'package:flutter/material.dart';

SizedBox customBackground(String assetName) {
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Image(
      image: AssetImage(assetName),
      fit: BoxFit.fill,
    ),
  );
}