// ignore_for_file: must_be_immutable

part of 'coins_bloc.dart';

class CoinsState extends Equatable {
  CoinsState({this.coinsMarketsList, this.candlestickData});

  List<CoinsModel>? coinsMarketsList;
  List<CandlestickData>? candlestickData;

  CoinsState copyWith({
    List<CoinsModel>? coinsMarketsList,
     List<CandlestickData>? candlestickData,
  }) {
    return CoinsState(
      coinsMarketsList: coinsMarketsList ?? this.coinsMarketsList,
      candlestickData: candlestickData ?? this.candlestickData,
    );
  }

  @override
  List<Object?> get props => [
        coinsMarketsList,
        candlestickData,
      ];
}
