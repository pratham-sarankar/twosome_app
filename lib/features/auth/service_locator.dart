import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twosome_app/core/di/init_services.dart';
import 'package:twosome_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:twosome_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:twosome_app/features/auth/domain/use_cases/delete_user.dart';
import 'package:twosome_app/features/auth/domain/use_cases/forgot_password.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'domain/use_cases/get_current_user.dart';
import 'domain/use_cases/sign_in_with_email.dart';
import 'domain/use_cases/sign_in_with_google.dart';
import 'domain/use_cases/sign_out.dart';
import 'domain/use_cases/sign_up_with_email.dart';

void setupAuth() {
  // Register repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl(),
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    ),
  );

  // Register use cases
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignUpWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => ForgotPassword(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));

  sl.registerFactory(
    () => AuthBloc(
      signInWithEmail: sl(),
      signUpWithEmail: sl(),
      signInWithGoogle: sl(),
      signOut: sl(),
      getCurrentUser: sl(),
      forgotPassword: sl(),
      deleteUser: sl(),
    ),
  );
}
