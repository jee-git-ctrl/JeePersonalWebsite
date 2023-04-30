import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'src/LoginPage.dart';
import 'package:info_bank/screens/home.dart';
import 'package:info_bank/tabs/tabspage.dart';
import 'package:info_bank/src/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "tAppName",
        theme: ThemeData(
          primaryColor: tPrimaryColor,
          scaffoldBackgroundColor: tPrimaryColor,
        ),
        //theme
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return TabsPage(selectedIndex: 0);
              } else {
                return const LoginPage();
              }
            }),
          ),
        ));
  }
}
