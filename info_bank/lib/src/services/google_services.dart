import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:info_bank/tmp_homepage.dart';
import '../RegisterPage.dart';

class Services {
  //function
  static Future<void> googleSignIn(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    //if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    if (googleSignInAuthentication.accessToken != null &&
        googleSignInAuthentication.idToken != null) {
      try {
        final result = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                accessToken: googleSignInAuthentication.accessToken,
                idToken: googleSignInAuthentication.idToken));
        //if new user
        if (result.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(result.user!.uid)
              .set({
            "Name": result.user!.displayName,
            "Email": result.user!.email,
            "Create_Date": Timestamp.now(),
            "Profile_complete": false //bool register finish or not
          });
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
}
