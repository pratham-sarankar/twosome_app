import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:twosome_app/features/auth/presentation/screens/auth_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
  ],
  redirect: (context, state) {
    final isAuthorized = FirebaseAuth.instance.currentUser != null;
    return isAuthorized ? null : '/auth';
  },
);
