  import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String text) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
    hintText: text,
    hintStyle: const TextStyle(fontSize: 14),
    label: Text(text),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xffe5e7f2),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xffe5e7f2),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xffe5e7f2),
      ),
    ),
    filled: true,
    fillColor: const Color(0xffe5e7f2),
  );


}