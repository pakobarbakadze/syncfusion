import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test/theme.dart';
import 'package:test/widgets/chart_card.dart';

class CartesianSync extends StatelessWidget {
  CartesianSync({super.key});

  final List<ChartData> chartData = [
    // Bind data source
    ChartData(DateTime(2023, 1), 5, 3),
    ChartData(DateTime(2023, 2), 30, 25),
    ChartData(DateTime(2023, 3), 25, 35),
    ChartData(DateTime(2023, 4), 45, 25),
    ChartData(DateTime(2023, 5), 5, 50)
  ];

  @override
  Widget build(BuildContext context) {
    return ChartCard(
      child: Expanded(
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: DateTimeAxis(
            intervalType: DateTimeIntervalType.months,
            dateFormat: DateFormat.MMM(),
            interval: 1,
            axisLine: const AxisLine(
              dashArray: <double>[1, 5],
            ),
            majorTickLines: const MajorTickLines(size: 0),
            majorGridLines: const MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            axisLine: const AxisLine(
              width: 0,
            ),
            majorTickLines: const MajorTickLines(size: 0),
            majorGridLines: const MajorGridLines(
              width: 1,
              color: Colors.grey,
              dashArray: <double>[1, 5],
            ),
          ),
          series: <ChartSeries>[
            _buildSplineSeries(
              chartData: chartData,
              borderColor: MyTheme.cyan,
              gradientColor: MyTheme.cyanGradient,
              yValueMapper: (ChartData data, _) => data.y,
            ),
            _buildSplineSeries(
              chartData: chartData,
              borderColor: MyTheme.blue,
              gradientColor: MyTheme.blueGradient,
              yValueMapper: (ChartData data, _) => data.y1,
            ),
          ],
        ),
      ),
    );
  }
}

SplineAreaSeries<ChartData, DateTime> _buildSplineSeries({
  required List<ChartData> chartData,
  required Color borderColor,
  required LinearGradient gradientColor,
  required double Function(ChartData, int) yValueMapper,
}) {
  return SplineAreaSeries<ChartData, DateTime>(
    borderWidth: 3,
    borderDrawMode: BorderDrawMode.top,
    borderColor: borderColor,
    enableTooltip: true,
    gradient: gradientColor,
    dataLabelSettings: const DataLabelSettings(
      labelPosition: ChartDataLabelPosition.inside,
    ),
    dataSource: chartData,
    xValueMapper: (ChartData data, _) => data.date,
    yValueMapper: yValueMapper,
  );
}

class ChartData {
  ChartData(this.date, this.y, this.y1);
  final DateTime date;
  final double y;
  final double y1;
}
