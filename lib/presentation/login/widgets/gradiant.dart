import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    required this.gradient,
  });

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(Offset.zero & bounds.size),
      child: Text(
        text,
        style: TextStyle(
            // The color must be set to white for this to work
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.09,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon, {
    required this.gradient1,
  });

  final Icon icon;
  final Gradient gradient1;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(shaderCallback: (bounds) => gradient1.createShader(Offset.zero & bounds.size), child: icon);
  }
}
