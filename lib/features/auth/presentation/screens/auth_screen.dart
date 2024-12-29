import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twosome_app/core/constants/assets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final scaffoldBgColor = theme.scaffoldBackgroundColor;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Image.asset(
                'assets/login_bg.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(00),
                  Colors.black.withAlpha(200),
                ],
              ),
            ),
          )),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: SizedBox(height: size.height * 0.02)),
                Text(
                  "2SOME",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
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
                    color: Colors.white,
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
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: scaffoldBgColor,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: scaffoldBgColor,
                            ),
                            prefixIcon: Icon(
                              CupertinoIcons.mail,
                              color: scaffoldBgColor,
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 60),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            fillColor: scaffoldBgColor.withAlpha(45),
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: scaffoldBgColor,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: scaffoldBgColor),
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              color: scaffoldBgColor,
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 60),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            fillColor: scaffoldBgColor.withAlpha(45),
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
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
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
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
                        const SizedBox(height: 30),
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
                                  ]),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
