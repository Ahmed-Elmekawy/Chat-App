import 'package:chat_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({
    super.key,
    required this.boarding,
    required this.pageView,
  });

  final List<BoardingModel> boarding;
  final PageController pageView;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => onBoarding(context,boarding[index]),
                  controller: pageView,
                  physics: const BouncingScrollPhysics(),
                  itemCount: boarding.length,
                )),
            SmoothPageIndicator(
              controller: pageView,
              count: boarding.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 1.01,
                spacing: 10,
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        );
  }
}

Widget onBoarding(context,BoardingModel boardingModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(
        image: AssetImage(boardingModel.image),
        height: boardingModel.height,
      ),
      const SizedBox(
        height: 16,
      ),
      Text(
        boardingModel.title,
        style: const TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          boardingModel.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1.5,
            fontSize: 14,
            color: Colors.white54,
          ),
        ),
      ),
      boardingModel.button(context),
    ],
  );
}