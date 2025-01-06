import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.onSaved});
  final FormFieldSetter<String>? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary,
      ),
      onSaved: onSaved,
      validator: (value) {
        final emailRegex =
            RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
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
          color: Theme.of(context).colorScheme.primary,
        ),
        prefixIcon: Icon(
          CupertinoIcons.mail,
          color: Theme.of(context).colorScheme.primary,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 60),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
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
            color: Theme.of(context).colorScheme.primary.withAlpha(150),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withAlpha(150),
            width: 1,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.primary.withAlpha(30),
        filled: true,
      ),
    );
  }
}
