import 'package:flutter/material.dart';

class SpacesHeight extends StatelessWidget {
  final double? height;
  const SpacesHeight(double d, {super.key, this.height});

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class SpacesWidth extends StatelessWidget {
  final double? width;
  const SpacesWidth({super.key, this.width});

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}