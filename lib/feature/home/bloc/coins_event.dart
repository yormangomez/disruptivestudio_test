part of 'coins_bloc.dart';

sealed class CoinsEvent extends Equatable {
  const CoinsEvent();

  @override
  List<Object> get props => [];
}

class CoinsMarketsEvent extends CoinsEvent {}

class CoinsKlinesEvent extends CoinsEvent {
  final String symbol;

  const CoinsKlinesEvent({
    required this.symbol,
  });

  @override
  List<Object> get props => [symbol];
}
