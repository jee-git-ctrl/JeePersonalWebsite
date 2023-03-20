import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding_screen/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
      title: tOnBoardingTitle1,
      subTitle: tOnBoardingSubTitle1,
      counterText: tOnBoardingCounter1,
      bgColor: tOnBoardingPage1Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      title: tOnBoardingTitle2,
      subTitle: tOnBoardingSubTitle2,
      counterText: tOnBoardingCounter2,
      bgColor: tOnBoardingPage2Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      title: tOnBoardingTitle3,
      subTitle: tOnBoardingSubTitle3,
      counterText: tOnBoardingCounter3,
      bgColor: tOnBoardingPage3Color,
    )),
  ];

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
