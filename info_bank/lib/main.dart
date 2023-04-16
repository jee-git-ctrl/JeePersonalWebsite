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
      title: 'InfoBank',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: UserScreen2(),
    );
  }
}
