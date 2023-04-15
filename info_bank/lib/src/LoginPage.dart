import 'package:flutter/material.dart';
import 'package:info_bank/src/services/google_services.dart';
import 'package:info_bank/tabs/tabspage.dart';

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
      appBar: AppBar(
        title: const Text('login page testing'),
        centerTitle: true,
      ),
      body: Center(
        // decoration: background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/infoBank_template.png', height: 100),
            SizedBox(
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/google_g_icon.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Sign In with Google")
                  ],
                ),
                onPressed: () {
                  _googleServices
                      .googleSignIn(context); //from google services .dart
                },
              ),
            ),
            SizedBox(
              width: 50,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
