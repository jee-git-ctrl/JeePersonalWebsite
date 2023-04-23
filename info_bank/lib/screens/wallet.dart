import 'package:flutter/material.dart';
import 'package:info_bank/src/widgets/transaction_data.dart';
import 'package:info_bank/src/widgets/transaction_item.dart';
import 'package:info_bank/src/widgets/transaction_detail.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _Wallet();
}

class _Wallet extends State<Wallet> {
  @override
  Widget build(BuildContext contect) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.chevron_left)),
        ),
        body: Container(
          child: Column(
            children: [
              //上半部 狀態
              Container(
                height: 200,
                color: Colors.amber,
                //points(number)
                //pie chart?
                //other menu
              ),
              //下半部 最近交易紀錄(可展開
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    )),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    child: Row(children: [
                      const Expanded(
                          child: Text(
                        "????紀錄",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext ctx) {
                                  return const DetailTransaction();
                                });
                          },
                          child: const Text("展開"))
                    ]),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return TransactionItem(transaction: transactions[index]);
                    },
                    itemCount: transactions.length,
                  ))
                ]),
              ))
            ],
          ),

          ///
        ));
  }
}
