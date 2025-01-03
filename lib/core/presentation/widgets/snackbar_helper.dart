import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackBarHelper {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.exclamationmark_triangle_fill,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Error",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Text(message),
            ],
          ),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ),
      );
  }

  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  "Success",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(message),
          ],
        ),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
        ),
      ),
    );
  }
}
