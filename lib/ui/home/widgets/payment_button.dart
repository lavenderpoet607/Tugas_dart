import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const PaymentButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector();
  }
}
