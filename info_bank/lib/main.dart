import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:info_bank/src/constants/allConstants.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';
import 'package:info_bank/src/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'src/LoginPage.dart';
import 'tmp_homepage.dart';

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
        theme: ThemeData(primarySwatch: Colors.green),
        //theme
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else {
                return const LoginPage();
              }
            }),
          ),
        ));
  }
}
