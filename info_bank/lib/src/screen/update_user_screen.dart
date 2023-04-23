import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/sizes.dart';
import '../constants/colors.dart';
import 'package:info_bank/src/services/firebase_services.dart';

class UpdateUserProfileScreen extends StatefulWidget {
  const UpdateUserProfileScreen({super.key});

  @override
  State<UpdateUserProfileScreen> createState() => _UpdateUserProfileScreen();
}

class _UpdateUserProfileScreen extends State<UpdateUserProfileScreen> {
  static final FServices _firebaseServices = FServices();
  //final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accController = TextEditingController();
  late TextEditingController _introController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  final String initNickname = "原本的暱稱";
  //focus node

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left)),
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(tAvatarImage1)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor),
                      child: const Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        //fetch old nickname
                        initialValue: initNickname,
                        decoration: const InputDecoration(
                          label: Text('暱稱'),
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        validator: validateName,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // fetch email data
                        initialValue: "fetch email here, unchangeable",
                        //readOnly: true,
                        enabled: false,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('個人介紹'),
                          prefixIcon: Icon(Icons.edit_note_outlined),
                        ),
                        controller: _introController,
                        validator: validateIntro,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 60)),
                          onPressed: () async {
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              final result = await _firebaseServices.updateUser(
                                  nickname: _nameController.toString(),
                                  intro: _introController.toString());

                              if (result!.contains('Success') &&
                                  context.mounted) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("個人資料更新完成"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text("了解"))
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: const Text(
                            "提交",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  //validator
  static String? validateName(String? value) {
    //check [A-Za-z0-9]
    if (!RegExp(r'^[a-zA-Z0-9\u4e00-\u9fa5]+$').hasMatch(value.toString())) {
      return "格式錯誤";
    } else {
      return null;
    }
  }

  static String? validateIntro(String? value) {
    if (value!.length > 200) {
      return "超過字數限制";
    } else {
      return null;
    }
  }
}
