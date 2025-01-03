import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twosome_app/core/presentation/widgets/snackbar_helper.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:twosome_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:twosome_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:twosome_app/features/auth/presentation/widgets/email_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final scaffoldBgColor = theme.scaffoldBackgroundColor;
    return AuthScaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print("Auth State: $state");
        if (state is AuthError) {
          SnackBarHelper.showError(context, state.message);
        }
        if (state is ForgotPasswordSuccess) {
          SnackBarHelper.showSuccess(context, state.message);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            // Forgot Password Form
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: EmailFormField(
                            onSaved: (newValue) {
                              email = newValue!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              _sendResetLink(context.read<AuthBloc>());
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
                            child: Text("Send Reset Link"),
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
              ),
          ],
        );
      },
    ));
  }

  void _sendResetLink(AuthBloc authBloc) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      authBloc.add(ForgotPasswordEvent(email: email));
    }
  }
}
