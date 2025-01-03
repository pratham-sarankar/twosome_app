import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.onSaved});
  final FormFieldSetter<String>? onSaved;
  @override
  Widget build(BuildContext context) {
    final scaffoldBgColor = Theme.of(context).scaffoldBackgroundColor;
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: scaffoldBgColor,
      ),
      onSaved: onSaved,
      validator: (value) {
        final emailRegex = RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
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
        prefixIconConstraints:
        BoxConstraints(minWidth: 60),
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
        errorStyle: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white38,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white70,
            width: 1,
          ),
        ),
        fillColor: scaffoldBgColor.withAlpha(45),
        filled: true,
      ),
    );
  }
}
