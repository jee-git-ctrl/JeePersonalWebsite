import 'package:flutter/material.dart';
import 'package:info_bank/src/services/google_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  static final Services _googleServices = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('tmp home page'),
        ),
        body: Column(
          children: [
            const Text('reloaded\nthis is a tmp home page'),
          ],
        ));
  }
}
