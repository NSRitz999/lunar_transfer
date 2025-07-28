import 'package:flutter/material.dart';
import 'package:ftk_ui/ftk_ui.dart';
import 'package:lunar_transfer/app/app.theme.dart';

class LunarButton extends StatelessWidget {
  const LunarButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(100);

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: radius,
          child: Ink(
            decoration: BoxDecoration(
              color: LunarPalette.eggWhite,
              borderRadius: radius,
              border: BoxBorder.all(
                width: 4,
                color: LunarPalette.black,
              ),
              boxShadow: LunarTheme.shadows,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16,
              ),
              child: Text(
                text,
                style: context.subtitle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
