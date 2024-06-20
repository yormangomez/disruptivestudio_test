part of 'injection_container.dart';

void _initNetworkInjections() {
  sl.registerLazySingleton<CenterApi>(() => CenterApi());
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
