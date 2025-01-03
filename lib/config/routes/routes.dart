class Routes {
  // Unauthenticated Routes
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Authenticated Routes
  static const String home = '/home';
  static const String discover = '$home/discover';
  static const String profile = '$home/profile';
}