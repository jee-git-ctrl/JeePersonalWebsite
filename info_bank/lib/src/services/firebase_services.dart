import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FServices {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //check if user profile is completed
  Future<bool> checkboolProfileCompleted(String email) async {
    try {
      return await _db
          .collection('Users')
          .where('Email', isEqualTo: email)
          .where('Profile_complete', isEqualTo: true)
          .get()
          .then((value) => value.size > 0 ? true : false);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  //check if user is added to database
  Future<bool> checkProfileComplete(String email) async {
    try {
      return await _db
          .collection('Users')
          .where('Email', isEqualTo: email)
          .get()
          .then((value) => value.size > 0 ? true : false);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  //check if acc is registered
  Future<bool> checkAccIsRegistered(String acc) async {
    try {
      return await _db
          .collection('Users')
          .where('accID', isEqualTo: acc)
          .get()
          .then((value) => value.size > 0 ? true : false);
    } catch (e) {
      debugPrint(e.toString());
      return true;
    }
  }

  //add new user to DB
  Future<String?> addUser({
    required String acc,
    required String nickname,
  }) async {
    try {
      CollectionReference users = _db.collection('Users');
      // call the user's CollectionReference to add a new user
      // if the collection/doc doesnt exist, Firebase will create one
      if (await checkAccIsRegistered(acc)) {
        //if true, already used
        return "帳號名稱已被使用";
      } else {
        await users.doc(_auth.currentUser!.uid).update(
            {'nickname': nickname, 'accID': acc, 'Profile_complete': true});
        return 'Success';
      }
    } catch (e) {
      return 'Error adding user: $e';
    }
  }

  //update user profile
  Future<String?> updateUser({
    required String nickname,
    required String intro,
  }) async {
    try {
      CollectionReference users = _db.collection('Users');
      // call the user's CollectionReference to add a new user
      // if the collection/doc doesnt exist, Firebase will create one
      /*
      if (await checkAccIsRegistered(acc)) {
        //if true, already used
        return "帳號名稱已被使用";
      } else {
      */
      await users
          .doc(_auth.currentUser!.uid)
          .update({'nickname': nickname, 'Introduction': intro});
      return 'Success';
      //}
    } catch (e) {
      return 'Error adding user: $e';
    }
  }
}
