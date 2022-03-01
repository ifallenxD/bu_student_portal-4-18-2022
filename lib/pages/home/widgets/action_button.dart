import 'package:bu_portal_app/globals.dart';
import 'package:flutter/material.dart';

class BUActionButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Color boxDecorationColor;
  final Color boxDecorationShadowColor;
  final IconData icon;
  final Color iconColor;
  final String text;
  final bool disabled;

  const BUActionButton({
    Key? key,
    required this.onPressed,
    this.boxDecorationColor = Colors.blue,
    this.boxDecorationShadowColor = Colors.grey,
    required this.icon,
    this.iconColor = Colors.white,
    this.text = '',
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        boxShadow: disabled
            ? null
            : [
                BoxShadow(
                  blurRadius: 3,
                  color: boxDecorationShadowColor,
                  offset: const Offset(0, 1),
                )
              ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: disabled ? colorCultured : boxDecorationColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: disabled ? null : onPressed,
          child: disabled
              ? null
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 32,
                      ),
                    ),
                    Text(
                      text,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
