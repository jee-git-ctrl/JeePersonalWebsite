import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_bank/src/widgets/transaction_data.dart';

class PostServices {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //get current user uid
  Future<String> getCurrentUser() async {
    try {
      final uid = _auth.currentUser!.uid;
      print(uid);
      return uid;
    } catch (e) {
      return 'Error getting current user id $e';
    }
  }

  //create new post
  Future<String> newQuestion(questionJSON) async {
    try {
      var id = '';
      final docRef = _db.collection('Questions').doc();
      await _db.runTransaction((transaction) async {
        transaction.set(docRef, questionJSON);
        id = docRef.id;
        // also add postID to tag
        // for (var i in questionJSON['Tags']) {}
      });
      // also add postID to tag

      return id;
    } catch (e) {
      return 'Error adding new question: $e';
    }
  }

//create new answer
  Future<String> newAnswer(answerJSON, QuestionID) async {
    try {
      var id = '';
      final docRef = _db
          .collection('Questions')
          .doc(QuestionID)
          .collection('Answers')
          .doc();
      await _db.runTransaction((transaction) async {
        transaction.set(docRef, answerJSON);
        id = docRef.id;
      });

      return id;
    } catch (e) {
      return 'Error adding new answer: $e';
    }
  }
}
