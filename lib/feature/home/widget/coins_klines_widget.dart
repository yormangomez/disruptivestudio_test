import 'dart:async';

import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:disruptivestudio_test/feature/home/bloc/coins_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsKlinesWidget extends StatelessWidget {
  final String symbol;
  const CoinsKlinesWidget({super.key,required this.symbol});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      context.read<CoinsBloc>().add(CoinsKlinesEvent(
          symbol: symbol != 'usdt'
              ? '${symbol.toString().toUpperCase()}USDT'
              : 'BTCUSDT'));
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.grey1,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<CoinsBloc, CoinsState>(
        builder: (context, state) {
          return state.candlestickData != null &&
                  state.candlestickData!.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                          color: AppColors.gray100.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(enabled: false),
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                    color: AppColors.grey1, width: 1),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  isCurved: false,
                                  color: Colors.blue,
                                  spots: state.candlestickData!.map((data) {
                                    return FlSpot(
                                        data.time.millisecondsSinceEpoch
                                            .toDouble(),
                                        data.close);
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
