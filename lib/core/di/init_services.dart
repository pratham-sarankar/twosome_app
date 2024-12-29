import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:twosome_app/core/network/network_info.dart';
import 'package:twosome_app/features/auth/service_locator.dart';

void initServices(){
  final sl = GetIt.instance;
  // Register NetworkInfoImpl
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));

  setupAuth();
}