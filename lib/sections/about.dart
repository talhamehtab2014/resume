import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_html/divider.dart';
import 'package:resume_html/sections/contact.dart';
import 'package:resume_html/utils/device_type_enum.dart';

class AboutMe extends StatelessWidget {
  final DeviceType deviceType;
  static const id = '/about';
  const AboutMe({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return deviceType == DeviceType.desktop
        ? Scaffold(
            backgroundColor: Colors.transparent,
            body: RawScrollbar(
              thumbColor: const Color(0xFFFF9800),
              child: SingleChildScrollView(
                child: pageContext(),
              ),
            ))
        : pageContext();
  }

  Column pageContext() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Heading(
            coloredText: "About ",
            normalText: "Me",
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            "Hello! I’m Talha Mehtab.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFA2A2A6),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            "Software engineer from Rawalpindi, Pakistan. Specializing in Flutter and Android development.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: const Color(0xFFA2A2A6),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Heading(
            coloredText: "My ",
            normalText: "Services",
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: serviceWidget(
                  icon: "assets/icons/android.png",
                  title: "Android Development",
                  description:
                      "Modern mobile apps responsive with all mobile screen sizes.",
                ),
              ),
              const GradientDivider(
                width: 1.5,
                height: 150,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF3B3C45),
                  Color(0xFF31313A),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: serviceWidget(
                  icon: "assets/icons/flutter.png",
                  title: "Flutter Development",
                  description:
                      "Cross-Platform apps responsive with all screen sizes.",
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Heading(
            coloredText: "Fun ",
            normalText: "Facts",
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: funFactWidget(
                  icon: "assets/icons/android.png",
                  title: "3 Apps\nDeveloped",
                ),
              ),
              const GradientDivider(
                width: 1.5,
                height: 150,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF3B3C45),
                  Color(0xFF31313A),
                ],
              ),
              Expanded(
                child: funFactWidget(
                  icon: "assets/icons/flutter.png",
                  title: "2 Apps\nDeveloped and 3 Apps Maintained",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column serviceWidget({String? icon, String? title, String? description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Container(
            padding: const EdgeInsets.all(8),
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
            child: Image.asset(
              icon!,
              color: const Color(0xFFFF9800),
              width: 20,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title!,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          description!,
          style: GoogleFonts.poppins(
            color: const Color(0xFFA2A2A6),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Column funFactWidget({String? icon, String? title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          icon!,
          color: const Color(0xFFFF9800),
          width: 30,
          height: 30,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
