import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:disruptivestudio_test/feature/auth/bloc/auth_bloc.dart';
import 'package:disruptivestudio_test/feature/home/bloc/coins_bloc.dart';
import 'package:disruptivestudio_test/flavor.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'blocs_injection.dart';
part 'network_injection.dart';
part 'repositories_injection.dart';
part 'resources_injection.dart';

/// Instance of the dependency injection container.
final sl = GetIt.instance;

/// Initialize the dependency injection container.
Future<void> init() async {
  //=======================
  // Network
  //=======================
  _initNetworkInjections();

  //=======================
  // DataSource / Resources
  //=======================
  _initResourcesInjections();

  //=======================
  // Repositories
  //=======================
  _initRepositoriesInjections();

  //=======================
  // Blocs
  //=======================
  _initBlocsInjections();

  if (Flavor.instance.showChuck == true) {}
}
