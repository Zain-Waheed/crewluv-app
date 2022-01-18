import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.06475101,0);
    path_0.lineTo(size.width*0.7996803,0);
    path_0.arcToPoint(Offset(size.width*0.8644313,size.height*0.03872550),radius: Radius.elliptical(size.width*0.06475101, size.height*0.03872550),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.8644313,size.height*0.6905693);
    path_0.cubicTo(size.width*0.8644313,size.height*0.6905693,size.width*0.8125650,size.height*0.6936469,size.width*0.8125650,size.height*0.7218355);
    path_0.cubicTo(size.width*0.8125650,size.height*0.7500241,size.width*0.8644313,size.height*0.7532723,size.width*0.8644313,size.height*0.7532723);
    path_0.lineTo(size.width*0.8644313,size.height*0.8801952);
    path_0.arcToPoint(Offset(size.width*0.7996803,size.height*0.9189207),radius: Radius.elliptical(size.width*0.06475101, size.height*0.03872550),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.06475101,size.height*0.9189207);
    path_0.arcToPoint(Offset(0,size.height*0.8801952),radius: Radius.elliptical(size.width*0.06475101, size.height*0.03872550),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(0,size.height*0.7539125);
    path_0.cubicTo(0,size.height*0.7539125,size.width*0.05135795,size.height*0.7503653,size.width*0.05135795,size.height*0.7224774);
    path_0.cubicTo(size.width*0.05135795,size.height*0.6945895,0,size.height*0.6893582,0,size.height*0.6893582);
    path_0.lineTo(0,size.height*0.03872550);
    path_0.arcToPoint(Offset(size.width*0.06475101,0),radius: Radius.elliptical(size.width*0.06475101, size.height*0.03872550),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}