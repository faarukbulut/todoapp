  import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String text) {
  return InputDecoration(
    border: OutlineInputBorder(),
    label: Text(text),
    floatingLabelBehavior: FloatingLabelBehavior.auto
  );
}