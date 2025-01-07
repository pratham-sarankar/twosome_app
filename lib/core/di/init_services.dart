import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twosome_app/core/network/network_info.dart';
import 'package:twosome_app/features/auth/service_locator.dart';
import 'package:twosome_app/features/dots/service_locator.dart';

final sl = GetIt.instance;

void initServices() {
  // Firebase Services
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerFactory<GoogleSignIn>(() => GoogleSignIn());

  // NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));

  setupAuthFeature();
  setupDotsFeature();
}
