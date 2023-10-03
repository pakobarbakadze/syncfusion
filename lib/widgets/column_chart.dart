import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test/widgets/chart_card.dart';

class ColumnChart extends StatelessWidget {
  ColumnChart({
    super.key,
  });

  final List<ChartData> chartData = [
    ChartData(DateTime(2023, 1), 6, 8),
    ChartData(DateTime(2023, 2), 5, 9),
    ChartData(DateTime(2023, 3), 9, 10),
    ChartData(DateTime(2023, 4), 6, 5),
    ChartData(DateTime(2023, 5), 7, 8),
    ChartData(DateTime(2023, 6), 3, 4),
    ChartData(DateTime(2023, 7), 2, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return ChartCard(
      child: Container(
        margin: const EdgeInsets.only(top: 65),
        height: 198,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: DateTimeCategoryAxis(
            intervalType: DateTimeIntervalType.months,
            dateFormat: DateFormat.MMM(),
            interval: 1,
            majorTickLines: const MajorTickLines(size: 0),
            majorGridLines: const MajorGridLines(width: 0),
            // rangePadding: ChartRangePadding.none,
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 10,
            interval: 4,
            axisLine: const AxisLine(width: 0),
            maximumLabelWidth: 0,
            majorTickLines: const MajorTickLines(size: 0),
            majorGridLines: const MajorGridLines(
              width: 1,
              color: Colors.grey,
              dashArray: <double>[5, 5],
            ),
          ),
          series: <ColumnSeries>[
            _buildColumnSeries(
              chartData: chartData,
              color: const Color(0xFF69C6F9),
              yValueMapper: (ChartData data, _) => data.current,
            ),
            _buildColumnSeries(
              chartData: chartData,
              color: const Color(0xFF25CED1),
              yValueMapper: (ChartData data, _) => data.previous,
            ),
          ],
        ),
      ),
    );
  }
}

ColumnSeries<ChartData, DateTime> _buildColumnSeries({
  required List<ChartData> chartData,
  required Color color,
  required double Function(ChartData, int) yValueMapper,
}) {
  return ColumnSeries<ChartData, DateTime>(
    spacing: 0.4,
    width: 0.5,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(5),
      topRight: Radius.circular(5),
    ),
    isTrackVisible: true,
    trackColor: const Color(0xFFB9CBDB).withOpacity(0.33),
    color: color,
    dataSource: chartData,
    xValueMapper: (ChartData data, _) => data.date,
    yValueMapper: yValueMapper,
  );
}

class ChartData {
  ChartData(this.date, this.current, this.previous);
  final DateTime date;
  final double current;
  final double previous;
}
