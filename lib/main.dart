import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twosome_app/config/routes/router.dart';
import 'package:twosome_app/config/themes/theme.dart';
import 'package:twosome_app/core/di/init_services.dart';
import 'package:twosome_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  // Initialize firebase app with default options for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TwoSomeApp());
}

class TwoSomeApp extends StatelessWidget {
  const TwoSomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(GoogleFonts.poppinsTextTheme());
    return MaterialApp.router(
      title: 'TwoSome',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}