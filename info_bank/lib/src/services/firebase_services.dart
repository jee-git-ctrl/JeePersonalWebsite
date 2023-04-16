import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:info_bank/src/RegisterPage.dart';
import 'package:info_bank/tabs/tabspage.dart';

class FServices {
  final userID = FirebaseAuth.instance.currentUser!.uid;

  //check if user profile is completed
  Future<void> checkUserProfileCompleted(context) async {
    final userData =
        await FirebaseFirestore.instance.collection('Users').doc(userID).get();

    if (userData.data()!['Profile_complete'] == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RegisterPage()));
    }
  }

  //add user
  Future<String?> addUser({
    required String acc,
    required String nickname,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      // call the user's CollectionReference to add a new user
      // if the collection/doc doesnt exist, Firebase will create one
      await users.doc(userID).set({'nickname': nickname, 'accID': acc});
      return 'Success';
    } catch (e) {
      return 'Error adding user: $e';
    }
  }
}
