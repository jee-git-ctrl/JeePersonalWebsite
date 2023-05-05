import 'package:flutter/material.dart';
import 'package:info_bank/src/RegisterPage.dart';
import 'package:info_bank/src/constants/buttons.dart';
import 'package:info_bank/src/services/google_services.dart';
import 'package:info_bank/tabs/tabspage.dart';
import 'constants/allConstants.dart';
import 'package:info_bank/src/constants/colors.dart';

// Login page with only google sign-in

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  static final Services _googleServices = Services();

  //set state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: tThirdColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/infoBank_template.png'),
              //Text('Welcome to info bank!'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: testButtonStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/Google_logo.png'),
                          )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("使用 Google 登入",
                            style: TextStyle(
                              color: Colors.black,
                            ))
                      ],
                    ),
                    onPressed: () {
                      _googleServices
                          .googleSignIn(context); //from google services .dart
                    },
                  ),
                ),
              ),
              // SizedBox(
              //   height: 100,
              // ),
              Container(
                width: 100,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(tThirdColor)),
                  child: Center(child: Text("")),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 0),
                    ));
                  },
                ),
              ),
              //debugging
              // ElevatedButton(
              //   style: testButtonStyle,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Text("register page")
              //     ],
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pushReplacement(MaterialPageRoute(
              //       builder: (context) => RegisterPage(),
              //     ));
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
