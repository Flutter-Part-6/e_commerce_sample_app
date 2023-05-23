import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    required this.icon,
    required this.onPressed,
    this.color = Colors.white,
    this.size = 24,
    super.key,
  });

  final IconData icon;
  final Color? color;
  final double? size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}
