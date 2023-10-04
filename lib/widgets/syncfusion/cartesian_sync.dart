import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test/theme.dart';
import 'package:test/widgets/chart_card.dart';

class CartesianSync extends StatelessWidget {
  CartesianSync({super.key});

  final List<ChartData> chartData = [
    ChartData(DateTime(2023, 1), 5, 3),
    ChartData(DateTime(2023, 2), 30, 25),
    ChartData(DateTime(2023, 3), 25, 35),
    ChartData(DateTime(2023, 4), 45, 25),
    ChartData(DateTime(2023, 5), 5, 50),
    ChartData(DateTime(2023, 6), 10, 35),
    ChartData(DateTime(2023, 7), 8, 26),
    ChartData(DateTime(2023, 8), 5, 30),
    ChartData(DateTime(2023, 9), 22, 32),
    ChartData(DateTime(2023, 10), 30, 35),
    ChartData(DateTime(2023, 11), 25, 40),
    ChartData(DateTime(2023, 12), 40, 45),
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
            interval: 2,
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
          tooltipBehavior: _buildTooltipBehavior(),
          trackballBehavior: _buildTrackballBehavior(),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
            enableDoubleTapZooming: true,
            zoomMode: ZoomMode.x,
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

TrackballBehavior _buildTrackballBehavior() {
  return TrackballBehavior(
    enable: true,
    activationMode: ActivationMode.singleTap,
    lineColor: MyTheme.purple,
    lineWidth: 4,
    hideDelay: 3,
    markerSettings: const TrackballMarkerSettings(
      markerVisibility: TrackballVisibilityMode.visible,
    ),
    builder: (context, trackballDetails) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffABD7EB),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Text(
          '\$${trackballDetails.point!.y}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}

TooltipBehavior _buildTooltipBehavior() {
  return TooltipBehavior(
    enable: true,
    builder: (data, point, series, pointIndex, seriesIndex) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffABD7EB),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Text(
          '\$${seriesIndex == 0 ? data.y : data.y1}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}

class ChartData {
  ChartData(this.date, this.y, this.y1);
  final DateTime date;
  final double y;
  final double y1;
}
