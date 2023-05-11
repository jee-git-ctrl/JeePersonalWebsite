import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/services/wallet_charts.dart';
import 'package:info_bank/src/widgets/income_analysis.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('我的點數'),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left)),
      ),
      body: Column(
        children: [
          //上半部 狀態
          Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: tPrimaryColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //cross
                        children: [
                          const Text(
                            "目前點數",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "35,000tmp",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Row(
                            children: [
                              const Text(
                                "更多分析",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.bar_chart_rounded),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IncomeAnalysis()),
                            ),
                          },
                        ),
                      ],
                    ),

                    // Expanded(child: MyPieChart()),
                    //可以直接使用widget
                  ],
                ),
              )

              /*
              onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyPieChart()),
                              ),
                            },
              */
              //points(number)
              //pie chart?
              //other menu
              ),
          //下半部 最近交易紀錄(可展開
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                color: tFifthColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Row(children: [
                  const Expanded(
                      child: Text(
                    "歷史紀錄",
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                  //要改成stream builder
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
    );
  }
}
