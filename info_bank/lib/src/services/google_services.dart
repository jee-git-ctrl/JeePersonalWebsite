import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
<<<<<<< HEAD
import 'package:info_bank/src/RegisterPage.dart';
import 'package:info_bank/src/services/firebase_services.dart';

import '../LoginPage.dart';
import 'package:info_bank/tabs/tabspage.dart';
import 'package:info_bank/tabs/tabspage.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FServices _firebaseServices = FServices();
=======

import 'package:info_bank/tmp_homepage.dart';
import '../RegisterPage.dart';
>>>>>>> jee

class Services {
  //function
  static Future<void> googleSignIn(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      //if (googleSignInAuthentication.accessToken != null &&
      //googleSignInAuthentication.idToken != null) {
      try {
        final result = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                accessToken: googleSignInAuthentication.accessToken,
                idToken: googleSignInAuthentication.idToken));
        //if new user
        if (result.additionalUserInfo!.isNewUser ||
            !await _firebaseServices
                .checkProfileComplete((result.user!.email).toString())) {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(result.user!.uid)
              .set({
            "Name": result.user!.displayName,
            "Email": result.user!.email
          });
<<<<<<< HEAD
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const RegisterPage(),
          ));
        } else if (await _firebaseServices
                .checkboolProfileCompleted((result.user!.email).toString()) ==
            false) {
          //email and name added but not complete
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const RegisterPage(),
          ));
        }
        //_firebaseServices.checkUserProfileCompleted(context);
        else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => TabsPage(selectedIndex: 0),
          ));
        }
=======
          // then navigate to register page
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => RegisterPage()));
        }
        //otherwise if acc exist
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
>>>>>>> jee
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
}
