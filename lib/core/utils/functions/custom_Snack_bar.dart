import 'package:flutter/material.dart';

void CustomSnakBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
