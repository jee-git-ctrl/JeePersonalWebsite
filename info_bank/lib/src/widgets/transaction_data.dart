// data model
class Transaction {
  final int id;
  final String fromUser;
  final String toUser;
  final String date;
  final String type;
  final String description;

  Transaction(this.id, this.fromUser, this.toUser, this.date, this.type,
      this.description);
}

// example datas
final List<Transaction> transactions = [
  Transaction(1, "kjs", "hjbhjff", "3/30", "sys", "+40"),
  Transaction(3, "kjs", "hjbhjff", "3/30", "sys", "+40"),
  Transaction(49, "kjs", "hjbhjff", "3/30", "sys", "-5"),
  Transaction(27, "kjs", "hjbhjff", "3/30", "sys", "+1"),
  Transaction(1, "kjs", "hjbhjff", "3/30", "sys", "+37"),
];
