import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/constants/assets.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:twosome_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:twosome_app/features/auth/presentation/widgets/email_form_field.dart';
import 'package:twosome_app/features/auth/presentation/widgets/password_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final scaffoldBgColor = theme.scaffoldBackgroundColor;
    return AuthScaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            SnackBarHelper.showError(context, state.message);
          } else if (state is Authenticated) {
            context.go(Routes.home);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Login Form
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Email Field
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: EmailFormField(
                              onSaved: (newValue) {
                                email = newValue!;
                              },
                            ),
                          ),
                          // Password Field
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: PasswordFormField(
                              onSaved: (newValue) {
                                password = newValue!;
                              },
                            ),
                          ),
                          // Forgot Password
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  context.push(Routes.forgotPassword);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.poppins(
                                    color: scaffoldBgColor,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Login Button
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                _login(context.read<AuthBloc>());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.016,
                                  horizontal: size.width * 0.14,
                                ),
                                elevation: 5,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minimumSize: Size(size.width, 0),
                                backgroundColor: primaryColor,
                                foregroundColor: scaffoldBgColor,
                                textStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              child: Text("Login"),
                            ),
                          ),
                          // Login with Google Button
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                _loginWithGoogle(context.read<AuthBloc>());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.015,
                                  horizontal: size.width * 0.14,
                                ),
                                elevation: 5,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minimumSize: Size(size.width, 0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(Assets.googleLogo),
                                  const SizedBox(width: 16),
                                  Text("Continue with Google"),
                                ],
                              ),
                            ),
                          ),
                          // Sign up link
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: GoogleFonts.poppins(
                                    color: scaffoldBgColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.push(Routes.signup);
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: GoogleFonts.poppins(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Loading Indicator
              if (state is AuthLoading)
                Center(
                  child: Container(
                    padding: EdgeInsets.all(size.width * 0.08),
                    decoration: BoxDecoration(
                      color: scaffoldBgColor.withAlpha(200),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primaryColor),
                      strokeWidth: 3,
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  void _login(AuthBloc bloc) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    bloc.add(SignInWithEmailEvent(email: email, password: password));
  }

  void _loginWithGoogle(AuthBloc bloc) {
    bloc.add(SignInWithGoogleEvent());
  }
}
