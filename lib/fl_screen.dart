import 'package:flutter/material.dart';
import 'package:test/widgets/flchart/column_fl.dart';
import 'package:test/widgets/flchart/doghnut_fl.dart';

class FlScreen extends StatelessWidget {
  const FlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColumnFl(),
        DoghnutFl(),
      ],
    );
  }
}
