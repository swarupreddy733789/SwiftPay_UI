import 'package:flutter/material.dart';

// GRAPH

class RPSCustomPainter extends CustomPainter {
  final double scaleFactor;

  RPSCustomPainter({this.scaleFactor = 1.55});

  @override
  void paint(Canvas canvas, Size size) {
    // Apply scaling transformation to the canvas
    canvas.save();
    canvas.scale(scaleFactor, scaleFactor);
    canvas.translate(0, -60);

    // Define the vertical gradient
    const gradient = LinearGradient(
      colors: [Color(0xF08A8A8A), Color(0x01FFFEF9)], // Example gradient colors
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Create a Paint object with the gradient
    Paint paintFill0 = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0850000, size.height * 0.5771429);
    path0.quadraticBezierTo(size.width * 0.1052417, size.height * 0.3638000,
        size.width * 0.1258333, size.height * 0.3028571);
    path0.cubicTo(
        size.width * 0.1292333,
        size.height * 0.2915857,
        size.width * 0.1367750,
        size.height * 0.2703143,
        size.width * 0.1498167,
        size.height * 0.2654000);
    path0.cubicTo(
        size.width * 0.1582000,
        size.height * 0.2674143,
        size.width * 0.1623583,
        size.height * 0.2752571,
        size.width * 0.1685167,
        size.height * 0.2988857);
    path0.cubicTo(
        size.width * 0.2143333,
        size.height * 0.5129000,
        size.width * 0.2147583,
        size.height * 0.5291286,
        size.width * 0.2450000,
        size.height * 0.5957143);
    path0.cubicTo(
        size.width * 0.2598250,
        size.height * 0.6211714,
        size.width * 0.2650000,
        size.height * 0.6275857,
        size.width * 0.2716667,
        size.height * 0.6314286);
    path0.cubicTo(
        size.width * 0.2801417,
        size.height * 0.6364429,
        size.width * 0.2859667,
        size.height * 0.6312143,
        size.width * 0.2966667,
        size.height * 0.6057143);
    path0.cubicTo(
        size.width * 0.3454000,
        size.height * 0.5002286,
        size.width * 0.3564583,
        size.height * 0.4186286,
        size.width * 0.3714417,
        size.height * 0.3528857);
    path0.cubicTo(
        size.width * 0.3784917,
        size.height * 0.3243714,
        size.width * 0.3873917,
        size.height * 0.3118286,
        size.width * 0.3966667,
        size.height * 0.3100000);
    path0.cubicTo(
        size.width * 0.4068583,
        size.height * 0.3120143,
        size.width * 0.4124083,
        size.height * 0.3262143,
        size.width * 0.4166667,
        size.height * 0.3485714);
    path0.cubicTo(
        size.width * 0.4401000,
        size.height * 0.4393000,
        size.width * 0.4573000,
        size.height * 0.4872571,
        size.width * 0.4866667,
        size.height * 0.5385714);
    path0.cubicTo(
        size.width * 0.4974583,
        size.height * 0.5624000,
        size.width * 0.5064333,
        size.height * 0.5757286,
        size.width * 0.5150000,
        size.height * 0.5728571);
    path0.cubicTo(
        size.width * 0.5260250,
        size.height * 0.5735857,
        size.width * 0.5317583,
        size.height * 0.5572286,
        size.width * 0.5383333,
        size.height * 0.5401571);
    path0.cubicTo(
        size.width * 0.5649500,
        size.height * 0.4927286,
        size.width * 0.5722083,
        size.height * 0.4830571,
        size.width * 0.5854750,
        size.height * 0.4725000);
    path0.quadraticBezierTo(size.width * 0.5968917, size.height * 0.4608714,
        size.width * 0.6163000, size.height * 0.4603286);
    path0.lineTo(size.width * 0.6190667, size.height * 0.7222286);
    path0.lineTo(size.width * 0.2500000, size.height * 0.7185714);
    path0.lineTo(size.width * 0.0833333, size.height * 0.7171429);
    path0.close(); // Close the path

    canvas.drawPath(path0, paintFill0);

    // Comment out or delete the border path code below

    // Define border path for curves on the top side
    Path borderPath = Path();
    borderPath.moveTo(size.width * 0.0850000, size.height * 0.5771429);
    borderPath.quadraticBezierTo(
        size.width * 0.1052417,
        size.height * 0.3638000,
        size.width * 0.1258333,
        size.height * 0.3028571);
    borderPath.cubicTo(
        size.width * 0.1292333,
        size.height * 0.2915857,
        size.width * 0.1367750,
        size.height * 0.2703143,
        size.width * 0.1498167,
        size.height * 0.2654000);
    borderPath.cubicTo(
        size.width * 0.1582000,
        size.height * 0.2674143,
        size.width * 0.1623583,
        size.height * 0.2752571,
        size.width * 0.1685167,
        size.height * 0.2988857);
    borderPath.cubicTo(
        size.width * 0.2143333,
        size.height * 0.5129000,
        size.width * 0.2147583,
        size.height * 0.5291286,
        size.width * 0.2450000,
        size.height * 0.5957143);
    borderPath.cubicTo(
        size.width * 0.2598250,
        size.height * 0.6211714,
        size.width * 0.2650000,
        size.height * 0.6275857,
        size.width * 0.2716667,
        size.height * 0.6314286);
    borderPath.cubicTo(
        size.width * 0.2801417,
        size.height * 0.6364429,
        size.width * 0.2859667,
        size.height * 0.6312143,
        size.width * 0.2966667,
        size.height * 0.6057143);
    borderPath.cubicTo(
        size.width * 0.3454000,
        size.height * 0.5002286,
        size.width * 0.3564583,
        size.height * 0.4186286,
        size.width * 0.3714417,
        size.height * 0.3528857);
    borderPath.cubicTo(
        size.width * 0.3784917,
        size.height * 0.3243714,
        size.width * 0.3873917,
        size.height * 0.3118286,
        size.width * 0.3966667,
        size.height * 0.3100000);
    borderPath.cubicTo(
        size.width * 0.4068583,
        size.height * 0.3120143,
        size.width * 0.4124083,
        size.height * 0.3262143,
        size.width * 0.4166667,
        size.height * 0.3485714);
    borderPath.cubicTo(
        size.width * 0.4401000,
        size.height * 0.4393000,
        size.width * 0.4573000,
        size.height * 0.4872571,
        size.width * 0.4866667,
        size.height * 0.5385714);
    borderPath.cubicTo(
        size.width * 0.4974583,
        size.height * 0.5624000,
        size.width * 0.5064333,
        size.height * 0.5757286,
        size.width * 0.5150000,
        size.height * 0.5728571);
    borderPath.cubicTo(
        size.width * 0.5260250,
        size.height * 0.5735857,
        size.width * 0.5317583,
        size.height * 0.5572286,
        size.width * 0.5383333,
        size.height * 0.5401571);
    borderPath.cubicTo(
        size.width * 0.5649500,
        size.height * 0.4927286,
        size.width * 0.5722083,
        size.height * 0.4830571,
        size.width * 0.5854750,
        size.height * 0.4725000);
    borderPath.quadraticBezierTo(
        size.width * 0.5968917,
        size.height * 0.4608714,
        size.width * 0.6163000,
        size.height * 0.4603286);

    // Draw the border on top curves
    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(170, 22, 22, 22) // Black color for border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.4 // Adjust the width as needed
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(borderPath, paintStroke0);

    // Restore the canvas
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
