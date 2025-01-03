import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/di/init_services.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:twosome_app/features/auth/presentation/screens/login_screen.dart';
import 'package:twosome_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:twosome_app/features/home/presentation/screens/home_screen.dart';
import 'package:twosome_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:twosome_app/features/spaces/presentation/screens/discover_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.login,
    routes: [
      // Unauthenticated Routes
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
          child: SignupScreen(),
        ),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
          child: ForgotPasswordScreen(),
        ),
      ),

      // Authenticated Routes (ShellRoute for Tabs)
      ShellRoute(
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: Routes.discover,
            builder: (context, state) => DiscoverScreen(),
          ),
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),
    ],

    // Redirection Logic
    redirect: (context, state) {
      final isAuthenticated = FirebaseAuth.instance.currentUser != null;
      final isLoggingIn = state.uri.path == Routes.login;

      // If unauthenticated and not on login/signup, redirect to login
      if (!isAuthenticated && !isLoggingIn) {
        return Routes.login;
      }

      // If authenticated and trying to go to login, redirect to /home/discover
      if (isAuthenticated && isLoggingIn) {
        return Routes
            .discover; // Redirect authenticated users to /home/discover
      }

      // If going to /home (direct access), redirect to /home/spaces
      if (state.uri.path == Routes.home) {
        return Routes.discover; // Redirect /home to /home/spaces
      }

      return null; // No redirection needed
    },
  );
}
