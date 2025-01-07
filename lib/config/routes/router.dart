import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/di/init_services.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:twosome_app/features/auth/presentation/screens/login_screen.dart';
import 'package:twosome_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:twosome_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:twosome_app/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_bloc.dart';
import 'package:twosome_app/features/dots/presentation/screens/dots_screen.dart';
import 'package:twosome_app/features/home/presentation/screens/home_screen.dart';
import 'package:twosome_app/features/profile/presentation/screens/account_screen.dart';
import 'package:twosome_app/features/profile/presentation/screens/profile_screen.dart';

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
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<AuthBloc>()),
          ],
          child: HomeScreen(child: child),
        ),
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => BlocProvider<DotsBloc>(
              create: (context) => sl<DotsBloc>(),
              child: DotsScreen(),
            ),
          ),
          GoRoute(
            path: Routes.contacts,
            builder: (context, state) => ContactsScreen(),
          ),
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => ProfileScreen(),
            routes: [
              GoRoute(
                path: 'account',
                builder: (context, state) => AccountScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: Routes.chat,
        builder: (context, state) => ChatScreen(),
      ),
    ],

    // Redirection Logic
    redirect: (context, state) {
      final isAuthenticated = FirebaseAuth.instance.currentUser != null;
      final isLoggingIn = state.uri.path.startsWith(Routes.auth);

      // If unauthenticated and not on login/signup, redirect to login
      if (!isAuthenticated && !isLoggingIn) {
        return Routes.login;
      }

      // If authenticated and trying to go to login, redirect to Routes.home
      if (isAuthenticated && isLoggingIn) {
        return Routes.home;
      }

      // If going to Routes.auth, redirect to Routes.login
      if (state.uri.path == Routes.auth) {
        return Routes.login;
      }

      return null; // No redirection needed
    },
  );
}
