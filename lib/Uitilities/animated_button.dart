import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? hoverColor;
  final Color? pressedColor;
  final Color? defaultColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxShadow? hoverShadow;

  const AnimatedButton({
    super.key,
    required this.child,
    this.onTap,
    this.hoverColor,
    this.pressedColor,
    this.defaultColor,
    this.borderRadius,
    this.padding,
    this.hoverShadow,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovering = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = widget.defaultColor ?? Colors.white;
    final Color hoverColor = widget.hoverColor ?? Colors.blueGrey[700]!;
    final Color pressedColor = widget.pressedColor ?? Colors.black;
    final BorderRadius borderRadius = widget.borderRadius ?? BorderRadius.circular(8);
    final EdgeInsetsGeometry padding = widget.padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12);
    final BoxShadow? hoverShadow = widget.hoverShadow ?? BoxShadow(
      color: Colors.blueGrey.withOpacity(0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    );

    Color bgColor = defaultColor;
    List<BoxShadow> boxShadow = [];
    if (_isPressed) {
      bgColor = pressedColor;
    } else if (_isHovering) {
      bgColor = hoverColor;
      if (hoverShadow != null) {
        boxShadow = [hoverShadow];
      }
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
