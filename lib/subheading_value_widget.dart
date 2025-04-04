import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubheadingValueWidget extends StatelessWidget {
  final String subheading;
  final String value;
  final Function()? onTap;
  const SubheadingValueWidget({
    super.key,
    required this.subheading,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: const Color(0xFFFF9800),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                subheading,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                child: Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFA2A2A6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
