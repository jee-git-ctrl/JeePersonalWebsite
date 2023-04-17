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
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF5FA9C0)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/infoBank_logo.png'),
              //Text('Welcome to info bank!'),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Google_logo.png'),
                      )),
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
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text("Debug Mode")
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TabsPage(selectedIndex: 0),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
