import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.red,
  accentColor: Colors.blueGrey.shade700
);

ThemeData friendTheme = ThemeData(
    primarySwatch: Colors.orange,
    accentColor: Colors.blueGrey.shade700
);

ThemeData familyTheme = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.blueGrey.shade700
);

ThemeData noTheme = ThemeData(
    primarySwatch: Colors.red,
    accentColor: Colors.blueGrey.shade700
);


ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.red
);

TextStyle get attachedStyle{
  return GoogleFonts.caveat(
      textStyle: TextStyle(
        fontSize: 36,
        //color: Colors.red
      ));
}

InputDecoration get attachedInput {
  return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),

      focusColor: Colors.red,
      hintStyle: TextStyle(color: Colors.red.shade300));
}