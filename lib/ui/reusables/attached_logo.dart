import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttachedLogo extends StatelessWidget{

  final Color? color;

  const AttachedLogo({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          'assets/images/app_logo.svg',
          height: 200,
          width: 200,
          color: color ?? Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
  
}