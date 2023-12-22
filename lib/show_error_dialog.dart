import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Verification failed"),
          content: Text(errorMessage),
        );
      });
}
