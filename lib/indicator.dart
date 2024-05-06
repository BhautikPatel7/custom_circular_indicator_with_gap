import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  final double strokeWidth;
  final List<double> progressValues;
  final List<Color> progressColors;
  final double gap;
  final List<IconData> icons;
  final Color iconColor;
  final double iconsize;
  double radiusvalue = 0;
  CircleProgress({
    required this.strokeWidth,
    required this.progressValues,
    required this.progressColors,
    required this.gap,
    required this.icons,
    required this.iconColor,
    required this.iconsize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundCircle = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;

    Paint arcPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2 - strokeWidth / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundCircle);
    double startAngle = -pi / 2;
    double sweepAngle = 0;

    if (progressValues.length == 1) {
      print("no of element");
      print(progressValues.length);
      radiusvalue = 105;
    } else {
      print("no of element");
      print(progressValues.length);
      radiusvalue = ((progressValues.length - 1) * 10) + 102;

      print(radiusvalue);
    }

    for (int i = 0; i < progressValues.length; i++) {
      sweepAngle = 2 * pi * (progressValues[i] / radiusvalue);
      arcPaint.color = progressColors[i];

      // Draw the arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        arcPaint,
      );

      // Calculate the position for icon
      double iconX = center.dx +
          (radius * cos(startAngle + sweepAngle)) -
          12.0; // Adjust the icon position
      double iconY = center.dy +
          (radius * sin(startAngle + sweepAngle)) -
          12.0; // Adjust the icon position

      // Draw the icon
      TextPainter(
        text: TextSpan(
          text: String.fromCharCode(icons[i].codePoint),
          style: TextStyle(
            fontFamily: icons[i].fontFamily,
            fontSize: iconsize, // Adjust the size of the icon as needed
            color: iconColor, // Adjust the color of the icon as needed
          ),
        ),
        textDirection: TextDirection.rtl,
      )
        ..layout()
        ..paint(canvas, Offset(iconX, iconY));

      startAngle += sweepAngle + gap * pi / 180; // Add gap angle
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
