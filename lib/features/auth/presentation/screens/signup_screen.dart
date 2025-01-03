import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twosome_app/config/routes/routes.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:twosome_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:twosome_app/features/auth/presentation/widgets/email_form_field.dart';
import 'package:twosome_app/features/auth/presentation/widgets/password_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          if (kDebugMode) {
            print("Auth State: $state");
          }
          if (state is AuthError) {
            SnackBarHelper.showError(context, state.message);
          }
          if (state is Authenticated) {
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
                            padding: const EdgeInsets.only(bottom: 20),
                            child: PasswordFormField(
                              onSaved: (newValue) {
                                password = newValue!;
                              },
                            ),
                          ),
                          // Signup Button
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                _signup(context.read());
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
                              child: Text("Sign up"),
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

  void _signup(AuthBloc bloc) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bloc.add(SignUpWithEmailEvent(email: email, password: password));
    }
  }
}
