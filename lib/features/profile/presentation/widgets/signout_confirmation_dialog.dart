import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignoutConfirmationDialog extends StatelessWidget {
  const SignoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Sign Out"),
      content: Text("Are you sure you want to sign out?"),
      actions: [
        TextButton(
          onPressed: () {
            context.pop(false);
          },
          child: Text("No"),
        ),
        ElevatedButton(
          onPressed: () {
            context.pop(true);
          },
          child: Text("Yes"),
        ),
      ],
    );
  }
}
