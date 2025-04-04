import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_html/divider.dart';
import 'package:resume_html/subheading_value_widget.dart';

class ContactMe extends StatelessWidget {
  static const id = '/contact';
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Heading(
              coloredText: "Get ",
              normalText: "in Touch",
            ),
          ),
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              children: [
                Expanded(
                  child: SubheadingValueWidget(
                    subheading: "Address",
                    value: "Rawalpindi, Pakistan",
                  ),
                ),
                Expanded(
                  child: SubheadingValueWidget(
                    subheading: "Email",
                    value: "Talhamehtab2014@gmail.com",
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              children: [
                Expanded(
                  child: SubheadingValueWidget(
                    subheading: "Phone No.",
                    value: "+92 336 5434969",
                  ),
                ),
                Expanded(
                  child: SubheadingValueWidget(
                    subheading: "Freelance",
                    value: "Available",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String coloredText;
  final String normalText;
  const Heading({
    super.key,
    required this.coloredText,
    required this.normalText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color(0xFFFF9800).withOpacity(0.2),
                      const Color(0xFF31313A),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                coloredText,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF9800),
                ),
              ),
              Text(
                normalText,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
