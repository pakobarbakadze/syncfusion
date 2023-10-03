import 'package:flutter/material.dart';
import 'package:test/widgets/Syncfusion/cartesian_Sync.dart';
import 'package:test/widgets/Syncfusion/column_Sync.dart';
import 'package:test/widgets/Syncfusion/doghnut_Sync.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColumnSync(),
          const DoghnutSync(),
          const CartesianSync(),
        ],
      ),
    );
  }
}
