import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Image(image: AssetImage(tLogoImage)),
          Text(tWelcomeTitle),
          Text(tWelcomeSubTitle),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: Text(tLogin)),
              ElevatedButton(onPressed: () {}, child: Text(tSignup)),
            ],
          )
        ],
      )),
    );
  }
}
