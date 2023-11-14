import 'package:flutter/material.dart';

// This class defines a custom painter for drawing a dotted border with circles.
class DottedBorderPainter extends CustomPainter {
  // Paint method to draw the dotted border.
  @override
  void paint(Canvas canvas, Size size) {
    // Paint object to define the appearance of the circles.
    final Paint paint = Paint()
      ..color = Colors.white // Change the color as needed
      ..strokeWidth = 1.0 // Adjust the width of the border
      ..style =
          PaintingStyle.fill; // Change to .stroke if you want unfilled circles

    // Constants to define the circle radius and space between circles.
    const double circleRadius = 0.5; // Adjust the radius of each circle
    const double circleSpace = 1.0; // Adjust the space between circles

    // Variable to track the starting X-coordinate for drawing circles.
    double startX = 0.0;

    // Loop to draw circles across the width of the canvas.
    while (startX < size.width) {
      canvas.drawCircle(Offset(startX, size.height), circleRadius, paint);
      startX += 2 * circleRadius + circleSpace;
    }
  }

  // Indicates whether the painter should repaint when the oldDelegate changes.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
