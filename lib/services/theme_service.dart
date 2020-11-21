import 'package:flutter/material.dart';

class ThemeService{

  Color getColorFromNumber(int number){
    switch (number){
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
    }
  }
}