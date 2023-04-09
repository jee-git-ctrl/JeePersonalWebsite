import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:info_bank/tmp_homepage.dart';
import 'package:info_bank/src/services/firebase_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final FServices _firebaseServices = FServices();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('tmp register page'),
        ),
        //body: const Text("register here!!")
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("電子信箱"),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const Text("show email here, uneditable"),
              ),
              const Text("帳號(自訂)"), //valid if used
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: _accController,
                ),
              ),
              const Text("暱稱"),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: _nameController,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final result = await _firebaseServices.addUser(
                        acc: _accController.text,
                        nickname: _nameController.text);
                    if (result!.contains('Success')) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                    }
                  },
                  child: const Text("Sign up!!!"))
            ],
          ),
        )

        // icon
        // userID
        // name
        // nickname
        //

        );
  }
}
