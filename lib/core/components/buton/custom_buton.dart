import 'package:flutter/material.dart';

normalElevatedButon(Function function, Color color, String text) {
  return ElevatedButton(
    onPressed: (){ function(); },
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

iconElevatedButon(Function function, IconData icon, String text) {
  return ElevatedButton.icon(
    onPressed: (){ function(); },
    icon: Icon(icon),
    label: Text(text),
  );
}