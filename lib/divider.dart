import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final double? width;
  final double? height;
  final Alignment? begin;
  final Alignment? end;
  final List<Color>? colors;
  const GradientDivider(
      {super.key, this.width, this.height, this.begin, this.end, this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 70,
      height: height ?? 1.2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors ??
                const [
                  Color(0xFF31313A),
                  Color(0xFF3B3C45),
                ],
            begin: begin ?? Alignment.centerLeft,
            end: end ?? Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}
