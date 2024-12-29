import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import '../../domain/use_cases/sign_in_with_email.dart';
import '../../domain/use_cases/sign_up_with_email.dart';
import '../../domain/use_cases/sign_in_with_google.dart';
import '../../domain/use_cases/sign_out.dart';
import '../../domain/use_cases/get_current_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmail signInWithEmail;
  final SignUpWithEmail signUpWithEmail;
  final SignInWithGoogle signInWithGoogle;
  final SignOut signOut;
  final GetCurrentUser getCurrentUser;

  AuthBloc({
    required this.signInWithEmail,
    required this.signUpWithEmail,
    required this.signInWithGoogle,
    required this.signOut,
    required this.getCurrentUser,
  }) : super(AuthInitial()) {
    on<SignInWithEmailEvent>(_onSignInWithEmail);
    on<SignUpWithEmailEvent>(_onSignUpWithEmail);
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignOutEvent>(_onSignOut);
    on<GetCurrentUserEvent>(_onGetCurrentUser);
  }

  Future<void> _onSignInWithEmail(
      SignInWithEmailEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final result = await signInWithEmail(SignInWithEmailParams(
      email: event.email,
      password: event.password,
    ));
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => emit(Authenticated(user: user)),
    );
  }

  Future<void> _onSignUpWithEmail(
      SignUpWithEmailEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final result = await signUpWithEmail(SignUpWithEmailParams(
      email: event.email,
      password: event.password,
    ));
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => emit(Authenticated(user: user)),
    );
  }

  Future<void> _onSignInWithGoogle(
      SignInWithGoogleEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final result = await signInWithGoogle(NoParams());
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => emit(Authenticated(user: user)),
    );
  }

  Future<void> _onSignOut(
      SignOutEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final result = await signOut(NoParams());
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (_) => emit(Unauthenticated()),
    );
  }

  Future<void> _onGetCurrentUser(
      GetCurrentUserEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final result = await getCurrentUser(NoParams());
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => emit(Authenticated(user: user)),
    );
  }
}
