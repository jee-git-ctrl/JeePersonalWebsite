// data model
class Transaction {
  final int id;
  final String toUser;
  final String date;
  final String type;
  final String amount;

  Transaction(this.id, this.toUser, this.date, this.type, this.amount);
}

// example datas
final List<Transaction> transactions = [];
