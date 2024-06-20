part of 'injection_container.dart';

void _initBlocsInjections() {
  sl.registerFactory(() => AuthBloc());
  sl.registerFactory(() => CoinsBloc(coinsRepository: sl()));
}
