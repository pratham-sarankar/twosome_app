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
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary,
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
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
        prefixIcon: Icon(
          CupertinoIcons.lock,
          color: Theme.of(context).colorScheme.primary,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          child: Icon(
            _isObscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        suffixIconConstraints: BoxConstraints(minWidth: 60),
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
