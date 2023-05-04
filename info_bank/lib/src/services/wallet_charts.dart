import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyPieChart extends StatefulWidget {
  MyPieChart({Key? key}) : super(key: key);

  @override
  State<MyPieChart> createState() => _MyPieChart();
}

class _MyPieChart extends State<MyPieChart> {
  late List<IncomeData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
      // title:
      // ChartTitle(text: 'Continent wise GDP - 2021 \n (in billions of USD)'),
      // legend:
      //    Legend(isVisible: false, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<IncomeData, String>(
          animationDuration: 10,
          dataSource: _chartData,
          xValueMapper: (IncomeData data, _) => data.type,
          yValueMapper: (IncomeData data, _) => data.portion,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.inside),
          // enableTooltip: false,
        )
      ],
    )));
  }

  List<IncomeData> getChartData() {
    final List<IncomeData> chartData = [
      IncomeData('回答', 1600),
      IncomeData('廣告', 2490),
      IncomeData('系統', 2900),
      IncomeData('標籤', 23050),
    ];
    return chartData;
  }
}

class IncomeData {
  IncomeData(this.type, this.portion);
  final String type;
  final int portion;
}

class MyStackChart extends StatefulWidget {
  MyStackChart({Key? key}) : super(key: key);

  @override
  State<MyStackChart> createState() => _MyStackChart();
}

class _MyStackChart extends State<MyStackChart> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
      // title:
      // ChartTitle(text: 'Continent wise GDP - 2021 \n (in billions of USD)'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries>[
        StackedAreaSeries<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (ExpenseData data, _) => data.expenseCategory,
            yValueMapper: (ExpenseData data, _) => data.father,
            name: "Father",
            markerSettings: MarkerSettings(isVisible: true)),
        StackedAreaSeries<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (ExpenseData data, _) => data.expenseCategory,
            yValueMapper: (ExpenseData data, _) => data.mother,
            name: "Mother",
            markerSettings: MarkerSettings(isVisible: true)),
        StackedAreaSeries<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (ExpenseData data, _) => data.expenseCategory,
            yValueMapper: (ExpenseData data, _) => data.son,
            name: "Son",
            markerSettings: MarkerSettings(isVisible: true)),
        StackedAreaSeries<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (ExpenseData data, _) => data.expenseCategory,
            yValueMapper: (ExpenseData data, _) => data.daughter,
            name: "Daughter",
            markerSettings: MarkerSettings(isVisible: true)),
      ],
      primaryXAxis: CategoryAxis(),
    )));
  }

  //以
  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('A', 16, 20, 28, 50),
      ExpenseData('B', 9, 29, 70, 37),
      ExpenseData('C', 42, 36, 1, 10),
      ExpenseData('D', 33, 44, 25, 7),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);

  final String expenseCategory;
  final int father;
  final int mother;
  final int son;
  final int daughter;
}
