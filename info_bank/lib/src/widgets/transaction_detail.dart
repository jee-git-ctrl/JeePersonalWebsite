import 'package:flutter/material.dart';
import 'transaction_data.dart';
import 'transaction_item.dart';

class DetailTransaction extends StatelessWidget {
  const DetailTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('交易紀錄'),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left)),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return TransactionItem(transaction: transactions[index]);
          },
          itemCount: transactions.length,
        ))
      ]),
    );
  }
}
