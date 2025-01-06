import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeletionConfirmationDialog extends StatelessWidget {
  const DeletionConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      content: const Text("This action cannot be undone."),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
