import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    this.width = 32,
    this.height = 32,
    required this.icon,
    this.iconSize = 24,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(4),
    required this.onPressed,
    super.key,
  });

  final String icon;
  final double iconSize;
  final double width;
  final double height;
  final Color color;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: padding,
        width: width,
        height: height,
        child: SvgPicture.asset(
          icon,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
