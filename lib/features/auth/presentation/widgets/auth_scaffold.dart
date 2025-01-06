import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Column(
                    children: [
                      Text(
                        "2SOME",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.white54,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Share the real you with your AI.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 1,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: body),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text.rich(
                    TextSpan(
                      text: "By signing up, you agree with our\n",
                      style: TextStyle(
                        color: Colors.grey.shade100.withAlpha(255),
                        fontSize: 14,
                        shadows: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
