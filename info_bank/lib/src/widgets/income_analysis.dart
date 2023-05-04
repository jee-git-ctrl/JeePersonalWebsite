import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/sizes.dart';
import 'package:info_bank/src/services/wallet_charts.dart';

class IncomeAnalysis extends StatefulWidget {
  const IncomeAnalysis({super.key});

  @override
  State<IncomeAnalysis> createState() => _IncomeAnalysis();
}

class _IncomeAnalysis extends State<IncomeAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('收益分析'),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.chevron_left)),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //收益來源比例
                const Text(
                  "   收益來源比例",
                  //textAlign: ,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                  color: Colors.black,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.width) - 150,
                  child: MyPieChart(),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "   trend",
                  //textAlign: ,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                  color: Colors.black,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.width) - 150,
                  child: MyStackChart(),
                ),
              ],
            ),
          ),
        ));
  }
}
