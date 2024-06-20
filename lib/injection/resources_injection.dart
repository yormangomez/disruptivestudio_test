part of 'injection_container.dart';

void _initResourcesInjections() {
  sl.registerFactory<CoinsResource>(() => CoinsResource(
        centerApi: sl(),
      ));
}
