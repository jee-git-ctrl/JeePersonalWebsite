import 'package:flutter/material.dart';
import 'transaction_data.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //decoration
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pink),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              //margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey),
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.attach_money) //depend on transaction type
                  ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    transaction.date,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Text(
                  transaction.toUser,
                ),
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  // transaction amount
                  "+ - \$ ${transaction.amount}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ));
  }
}
