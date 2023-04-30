// data model
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final int id;
  final String toUser;
  final String date;
  final int type;
  final String amount;
  final String description;

  Transaction(this.id, this.toUser, this.date, this.type, this.amount,
      this.description);
}

// example datas
final List<Transaction> transactions = [];
