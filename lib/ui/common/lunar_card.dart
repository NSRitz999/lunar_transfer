import 'package:flutter/material.dart';
import 'package:lunar_transfer/app/app.theme.dart';

class LunarCard extends StatelessWidget {
  const LunarCard({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
  });

  final Widget child;

  final double? width;

  final double? height;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: LunarTheme.padding,
      decoration: BoxDecoration(
        color: LunarPalette.eggWhite,
        borderRadius: LunarTheme.defaultBorderRadius,
        border: BoxBorder.all(width: 4),
        boxShadow: LunarTheme.shadows,
      ),
      child: child,
    );
  }
}
