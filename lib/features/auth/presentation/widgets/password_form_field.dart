import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, required this.onSaved});

  final FormFieldSetter<String> onSaved;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final scaffoldBgColor = Theme.of(context).scaffoldBackgroundColor;
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: scaffoldBgColor,
      ),
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500, color: scaffoldBgColor),
        prefixIcon: Icon(
          CupertinoIcons.lock,
          color: scaffoldBgColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          child: Icon(
            _isObscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: scaffoldBgColor,
          ),
        ),
        suffixIconConstraints: BoxConstraints(minWidth: 60),
        prefixIconConstraints: BoxConstraints(minWidth: 60),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white38,
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
        errorStyle: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontWeight: FontWeight.w500,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white70,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        fillColor: scaffoldBgColor.withAlpha(45),
        filled: true,
      ),
    );
  }
}
