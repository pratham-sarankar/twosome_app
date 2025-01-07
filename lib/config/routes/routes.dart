class Routes {
  // Unauthenticated Routes
  static const String auth = '/auth';
  static const String login = '$auth/login';
  static const String signup = '$auth/signup';
  static const String forgotPassword = '$auth/forgot-password';

  // Authenticated Routes
  static const String home = '/home';
  static const String contacts = '/contacts';
  static const String profile = '/profile';
  static const String chat = '/chat';

  // Profile Routes
  static const String account = '$profile/account';
}
