import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyPieChart extends StatefulWidget {
  MyPieChart({Key? key}) : super(key: key);

  @override
  _MyPieChart createState() => _MyPieChart();
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
      legend:
          Legend(isVisible: false, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<IncomeData, String>(
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
      IncomeData('Oceania', 1600),
      IncomeData('Africa', 2490),
      IncomeData('S America', 2900),
      IncomeData('Europe', 23050),
    ];
    return chartData;
  }
}

class IncomeData {
  IncomeData(this.type, this.portion);
  final String type;
  final int portion;
}
