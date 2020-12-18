import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttachedLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          'assets/images/app_logo.svg',
          height: 200,
          color: themeService.darkColor,
        ),
      ),
    );
  }
  
}