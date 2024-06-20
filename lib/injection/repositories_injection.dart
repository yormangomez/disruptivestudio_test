part of 'injection_container.dart';

void _initRepositoriesInjections() {
  sl.registerFactory<CoinsRepository>(
      () => CoinsRepositoryImpl(coinsResource: sl()));
}
