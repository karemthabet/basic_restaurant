
import 'package:flutter/material.dart';
void showSnackBarFuction(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
            ),
      ),
    ),
  );
}
