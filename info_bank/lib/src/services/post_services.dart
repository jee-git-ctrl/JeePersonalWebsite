import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostServices {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //create new post
  Future<String> newQuestion(questionJSON) async {
    try {
      final docRef = _db.collection('Questions').doc();
      await _db.runTransaction((transaction) async {
        transaction.set(docRef, questionJSON);
      });
      //
      // also add post id to doc("tags")
      //
      //
      final id = docRef.id;
      return id;
    } catch (e) {
      return 'Error adding new question: $e';
    }
  }

//create new answer
  Future<String> newAnswer(answerJSON) async {
    try {
      return '';
    } catch (e) {
      return 'Error adding new answer: $e';
    }
  }
}
