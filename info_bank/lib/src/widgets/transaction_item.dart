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
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //decoration
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pink),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 35,
                height: 35,
                child: SizedBox(child: Text("T")),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    transaction.toUser,
                    //style
                  ),
                ),
                Text(
                  transaction.date,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    // transaction amount
                    "+ - \$ ${transaction.description}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  transaction.description,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ));
  }
}
