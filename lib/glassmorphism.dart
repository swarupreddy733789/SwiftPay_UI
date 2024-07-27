import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;

  const GlassMorphism({
    super.key,
    required this.blur,
    required this.opacity,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: EdgeInsets.all(10),
          width: width,
          height: height,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 141, 135, 135).withOpacity(0.9)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
