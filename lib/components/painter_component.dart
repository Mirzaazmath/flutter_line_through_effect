import 'package:flutter/material.dart';
class LinePainter extends CustomPainter{
  final screenWidth;
  final screenHeight;
  LinePainter({this.screenHeight,this.screenWidth});
  @override
  void paint(Canvas canvas, Size size) {
    // START POINT
    var startPoint=Offset(0, screenHeight/2);
    // END POINT
    var endPoint=Offset(screenWidth, screenHeight/2);
    // PAINT BRUSH
    Paint paint=Paint()..color=Colors.white..strokeWidth=10..strokeCap=StrokeCap.round;
    // DRAWING ON CANVAS
    canvas.drawLine(startPoint, endPoint, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;

}