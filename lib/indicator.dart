import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  final double strokeWidth;
  final List<double> progressValues;
  final List<Color> progressColors;
  final double gap;
  final List<IconData> icons;
  CircleProgress({
    required this.strokeWidth,
    required this.progressValues,
    required this.progressColors,
    this.gap = 0,
    required this.icons,
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

    for (int i = 0; i < progressValues.length; i++) {
      sweepAngle = 2 * pi * (progressValues[i] / 140);
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
            fontSize: 24.0, // Adjust the size of the icon as needed
            color: Colors.black, // Adjust the color of the icon as needed
          ),
        ),
        textDirection: TextDirection.ltr,
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
