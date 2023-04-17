import 'package:flutter/material.dart';
import 'package:info_bank/firebase_options.dart';
import 'package:info_bank/src/LoginPage.dart';
import 'package:info_bank/src/utils/theme/theme.dart';
import 'package:info_bank/src/screen/user_screen1.dart';
import 'package:info_bank/src/screen/user_screen2.dart';

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
        theme: ThemeData(primarySwatch: Colors.cyan),
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
