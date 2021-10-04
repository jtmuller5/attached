import 'dart:math';
import 'dart:ui';

import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:stacked_themes/stacked_themes.dart';

class HeaderPainter extends CustomPainter {

  final BuildContext context;

  HeaderPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {

    var rect = Offset.zero & size* 2;

    var gradient = RadialGradient(
      focalRadius: 40,
      colors: [
       // Colors.transparent,
        //Theme.of(context).primaryColorDark,
        Colors.black54,
        Colors.green,
        Colors.transparent
      ]
    );

    Paint paintDark = Paint()
    ..color = Colors.grey;
    //..color = Theme.of(context).primaryColorDark;
    //..shader = gradient.createShader(rect);

    Paint paintLight = Paint()
      ..color = Colors.white;

    Paint glowPaint = Paint()
    ..shader = gradient.createShader(Rect.fromCircle(
      center: Offset(80,80),
      radius: 80
    ));

    canvas.translate(-50, 50);
    canvas.rotate(-(size.aspectRatio * 3));
    canvas.translate(-50, -50);
    canvas.save();
    canvas.restore();

    canvas.drawRect(rect, paintDark);

    canvas.translate(0, 200);
    //canvas.rotate(-pi/16);
   // canvas.translate(-50, -50);

    canvas.drawRect(rect, paintLight);

    canvas.drawCircle(Offset(80,80), 80, glowPaint);
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(HeaderPainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(HeaderPainter oldDelegate) => false;
}