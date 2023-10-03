import 'package:flutter/material.dart';
import 'package:test/widgets/column_chart.dart';
import 'package:test/widgets/doghnut_chart.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColumnChart(),
        const DoghnutChart(),
      ],
    );
  }
}
