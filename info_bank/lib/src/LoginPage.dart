import 'package:flutter/material.dart';
import 'package:info_bank/src/services/google_services.dart';

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
            Placeholder(
              //infobank icon
              fallbackWidth: 100,
              fallbackHeight: 100,
            ),
            Text('welcome to info bank!'),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
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
            )
          ],
        ),
      ),
    );
  }
}
