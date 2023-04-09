import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:info_bank/src/services/firebase_services.dart';

import '../LoginPage.dart';
import 'package:info_bank/tabs/tabspage.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FServices _firebaseServices = FServices();

class Services {
  //

  //function
  Future<void> googleSignIn(context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    //if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    if (googleSignInAuthentication.accessToken != null &&
        googleSignInAuthentication.idToken != null) {
      try {
        final result = await _firebaseAuth.signInWithCredential(
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
        //_firebaseServices.checkUserProfileCompleted(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => TabsPage(selectedIndex: 0),
        ));
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }

  Future<void> signOut(context) async {
    final googleCurrentUser = _firebaseAuth.currentUser;
    if (googleCurrentUser != null) {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
    } else {
      await _firebaseAuth.signOut();
    }

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
