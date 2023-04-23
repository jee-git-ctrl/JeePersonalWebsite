import 'package:flutter/material.dart';
import 'transaction_data.dart';
import 'transaction_item.dart';

class DetailTransaction extends StatelessWidget {
  const DetailTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Row(children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            const Text(
              "交易紀錄",
              style: TextStyle(fontSize: 18),
            )
          ]),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return TransactionItem(transaction: transactions[index]);
          },
          itemCount: transactions.length,
        ))
      ],
    );
  }
}
