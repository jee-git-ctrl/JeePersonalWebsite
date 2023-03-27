import 'package:flutter/material.dart';
import 'package:info_bank/tabs/tabspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primaryColor: const Color(0xff181818),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff272727),
        ),
      ),
      home: TabsPage(selectedIndex: 0),
      debugShowCheckedModeBanner: false,
    );
  }
}
