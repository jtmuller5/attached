import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeService {
  Color get darkColor {
    return Colors.red.shade800;
  }

  ThemeData get appTheme {
    return ThemeData(
      primarySwatch: Colors.red,
      textTheme: TextTheme(
          body1: TextStyle(color: darkColor),
          button: TextStyle(color: Colors.white)
      ),
      buttonTheme: ButtonThemeData(
        //colorScheme: ColorScheme.dark(),
        buttonColor: darkColor,
      ),
    );
  }

  InputDecoration get appInput {
    return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        filled: true,
        fillColor: Colors.grey.shade300,
        focusColor: Colors.red,
        hintStyle: TextStyle(color: Colors.red.shade300));
  }

  Color getColorFromNumber(int number) {
    switch (number) {
      case 0:
        return Colors.blue;
        break;
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.red;
        break;
      case 3:
        return Colors.yellow;
        break;
      case 4:
        return Colors.purple;
        break;
      default:
        return Colors.red;
    }
  }
}
