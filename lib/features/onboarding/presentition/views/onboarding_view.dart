import 'package:chat_app/core/functions/navigation.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/features/login/presentition/views/login_view.dart';
import 'package:chat_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

import 'widgets/onboarding_view_body.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pageView = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: OnBoardingViewBody(boarding: boarding, pageView: pageView));
  }
}

List<BoardingModel> boarding = [
  BoardingModel(
      image: AssetConstants.logoWhite,
      height: 100,
      title: "ChatMe",
      button: (context) => const SizedBox(),
      description: "Chat with anyone from anywhere"),
  BoardingModel(
      image: AssetConstants.welcomeImage,
      height: 200,
      title: "Send Free Messages",
      description:
          "Spice up your text messages with these multiple options and stickers with positive messages ,positive affirmations and more",
      button: (context) => Padding(
        padding: const EdgeInsets.only(top: 80),
        child: customButton(
              onPressed: () => navigateTo(context, const Login()),
              text: "Start Login",
              colorText: Colors.black,
              buttonColor: Colors.white,
            ),
      )),
];
