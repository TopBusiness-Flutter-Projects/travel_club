import 'package:flutter/material.dart';

class CustomContainerWithShadow extends StatelessWidget {
  const CustomContainerWithShadow({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.isShadow = true,  this.color,
  });

  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final bool isShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color:color?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isShadow
            ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Shadow position
          ),
        ]
            : [], // No shadow when isShadow is false
      ),
      child: child,
    );
  }
}
