import 'package:flutter/material.dart';

class Messages {
  Messages._();

  static erro(BuildContext context, String message) {
    final msg = message.isEmpty ? "Ocorreu um erro" : message;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }
}
