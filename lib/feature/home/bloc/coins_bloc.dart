import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final CoinsRepository coinsRepository;

  CoinsBloc({
    required this.coinsRepository,
  }) : super(CoinsState()) {
    on<CoinsEvent>((event, emit) {});

    on<CoinsMarketsEvent>((event, emit) async {
      final resultDb = await coinsRepository.coinsMarkets();

      resultDb.fold((l) => null, (r) {
        emit(state.copyWith(coinsMarketsList: r));
      });
    });

    on<CoinsKlinesEvent>((event, emit) async {
      final resultDb = await coinsRepository.coinsKlines(symbol: event.symbol);

      resultDb.fold((l) => null, (r) {
        final data = r
            .map((e) => CandlestickData(
                  time: DateTime.fromMillisecondsSinceEpoch(e[0]),
                  open: double.parse(e[1]),
                  high: double.parse(e[2]),
                  low: double.parse(e[3]),
                  close: double.parse(e[4]),
                ))
            .toList();
        emit(state.copyWith(candlestickData: data));
      });
    });
  }
}
