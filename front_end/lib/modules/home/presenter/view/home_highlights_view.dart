import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../store/home_store.dart';

class HomeHighlightsView extends StatefulWidget {
  const HomeHighlightsView({super.key});

  @override
  State<HomeHighlightsView> createState() => _HomeHighlightsViewState();
}

class _HomeHighlightsViewState extends State<HomeHighlightsView> {
  final _store = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchStatisticsHighlights();
    _store.fetchStatisticsDailySales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Highlights')),
      body: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final dailySales = _store.statisticsDailySales?.dailySales ?? [];
          final highlights = _store.statisticsHighlights;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sales per Day',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child:
                      dailySales.isEmpty
                          ? const Center(
                            child: Text('No sales data available.'),
                          )
                          : BarChart(
                            BarChartData(
                              borderData: FlBorderData(show: false),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final index = value.toInt();
                                      if (index < 0 ||
                                          index >= dailySales.length) {
                                        return const SizedBox.shrink();
                                      }
                                      final dateStr = dailySales[index].date;
                                      String label = '';
                                      try {
                                        final date = DateTime.parse(dateStr);
                                        label =
                                            '${date.day}/${date.month}/${date.year.toString().substring(2)}';
                                      } catch (_) {
                                        label = dateStr;
                                      }
                                      return Text(
                                        label,
                                        style: const TextStyle(fontSize: 10),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              barGroups:
                                  dailySales.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final value = entry.value;
                                    return BarChartGroupData(
                                      x: index,
                                      barRods: [
                                        BarChartRodData(
                                          toY: value.totalSales,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    );
                                  }).toList(),
                            ),
                          ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Highlights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildHighlightCard(
                  title: 'Most Total',
                  name: highlights?.mostTotal.name ?? '-',
                  email: highlights?.mostTotal.email ?? '-',
                  subtitle: 'Total: ${highlights?.mostTotal.value ?? 0}',
                ),
                _buildHighlightCard(
                  title: 'Most average',
                  name: highlights?.mostAverage.name ?? '-',
                  email: highlights?.mostAverage.email ?? '-',
                  subtitle: 'Average: ${highlights?.mostAverage.value ?? 0}',
                ),
                _buildHighlightCard(
                  title: 'Most frequent',
                  name: highlights?.mostFrequent.name ?? '-',
                  email: highlights?.mostFrequent.email ?? '-',
                  subtitle: 'Frequency: ${highlights?.mostFrequent.value ?? 0}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHighlightCard({
    required String title,
    required String name,
    required String email,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(name), Text(email), Text(subtitle)],
        ),
      ),
    );
  }
}
