import 'dart:async';

import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:disruptivestudio_test/feature/home/bloc/coins_bloc.dart';
import 'package:disruptivestudio_test/feature/home/widget/coins_klines_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      context.read<CoinsBloc>().add(CoinsMarketsEvent());
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Crypto Market',
          style: UITextStyle.labels.label.copyWith(
            color: AppColors.grey1,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<CoinsBloc, CoinsState>(
        builder: (context, state) {
          return state.coinsMarketsList != null &&
                  state.coinsMarketsList!.isNotEmpty
              ? ListView.builder(
                  itemCount: state.coinsMarketsList!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = state.coinsMarketsList![index];
                    return InkWell(
                      onTap: () {
                        context.read<CoinsBloc>().add(CoinsKlinesEvent(
                            symbol: data.symbol != 'usdt'
                                ? '${data.symbol.toString().toUpperCase()}USDT'
                                : 'BTCUSDT'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoinsKlinesWidget(
                                    symbol: data.symbol != 'usdt'
                                        ? '${data.symbol.toString().toUpperCase()}USDT'
                                        : 'BTCUSDT',
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  data.image.toString(),
                                  width: 40,
                                  height: 40,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data.name.toString(),
                                      style: UITextStyle.labels.label.copyWith(
                                        color: AppColors.grey1,
                                      ),
                                    ),
                                    Text(
                                      data.currentPrice.toString(),
                                      style: UITextStyle.labels.label.copyWith(
                                        color: AppColors.grey1,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                      const      Divider(),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
