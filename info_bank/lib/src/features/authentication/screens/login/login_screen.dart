import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/sizes.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/sizes.dart';
import 'package:info_bank/src/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Image(
                image: AssetImage(tLogoImage),
                height: size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
