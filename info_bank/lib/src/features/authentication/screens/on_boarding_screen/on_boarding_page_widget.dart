import 'package:flutter/material.dart';
import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(tDefaultSize),
        color: model.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(model.title,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  model.subTitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(model.counterText,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: 50.0,
            )
          ],
        ));
  }
}
