import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? paddingX;
  final double? paddingY;
  final double? marginX;
  final double? marginY;
  final Alignment? childAlignment;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.childAlignment,
    this.width,
    this.height,
    this.paddingX = 0,
    this.paddingY = 0,
    this.borderColor,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.marginX = 0,
    this.marginY = 0,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1,
        duration: Duration(milliseconds: 100),
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: widget.childAlignment,
          margin: EdgeInsets.only(
            left: widget.marginX!,
            right: widget.marginX!,
            top: widget.marginY!,
            bottom: widget.marginY!,
          ),
          padding: EdgeInsets.only(
            left: widget.paddingX!,
            right: widget.paddingX!,
            top: widget.paddingY!,
            bottom: widget.paddingY!,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            border: Border.all(
              width: widget.borderWidth!,
              color: widget.borderColor ?? widget.backgroundColor,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
