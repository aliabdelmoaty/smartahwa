import 'package:flutter/material.dart';

import '../../models/report_model.dart';
import 'summary_card_item.dart';

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key, required this.report});

  final Report? report;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SummaryCardItem(
            icon: Icons.receipt_long,
            value: report?.totalOrders.toString() ?? '0',
            title: 'Total Orders',
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: SummaryCardItem(
            icon: Icons.check_circle,
            value: report?.completedOrders.toString() ?? '0',
            title: 'Completed',
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: SummaryCardItem(
            icon: Icons.pending,
            value: report?.pendingOrders.toString() ?? '0',
            title: 'Pending',
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
