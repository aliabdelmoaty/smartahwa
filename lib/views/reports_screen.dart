import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/cubit/management_cubit.dart';
import 'widgets/build_drink_ranking_card.dart';
import 'widgets/summary_cards.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Reports'),
        centerTitle: true,
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ManagementCubit, ManagementState>(
        builder: (context, state) {
          final cubit = context.read<ManagementCubit>();
          final report = cubit.report;

          if (report == null || report.totalOrders == 0) {
            return const EmptyReport();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Cards
                SummaryCards(report: report),
                const SizedBox(height: 24),
                // Top Selling Drinks Section
                const Text(
                  'Top Selling Drinks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 16),

                if (report.topSellingDrinks.isEmpty)
                  const Center(
                    child: Text(
                      'No drink sales data available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                else
                  ...(report.topSellingDrinks.entries.toList()
                        ..sort((a, b) => b.value.compareTo(a.value)))
                      .map(
                        (entry) => BuildDrinkRankingCard(
                          drink: entry.key,
                          count: entry.value,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EmptyReport extends StatelessWidget {
  const EmptyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart_outlined, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No sales data yet',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add some orders to see reports',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
