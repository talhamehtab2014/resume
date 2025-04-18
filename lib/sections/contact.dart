import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Personal_Portfolio/divider.dart';
import 'package:Personal_Portfolio/subheading_value_widget.dart';
import 'package:Personal_Portfolio/utils/device_type_enum.dart' as dv;
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  final dv.DeviceType deviceType;
  static const id = '/contact';
  const ContactMe({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return deviceType == dv.DeviceType.desktop
        ? Scaffold(
            backgroundColor: Colors.transparent,
            body: pageContent(),
          )
        : pageContent();
  }

  Column pageContent() {
    return Column(
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: [
              const Expanded(
                child: SubheadingValueWidget(
                  subheading: "Address",
                  value: "Rawalpindi, Pakistan",
                ),
              ),
              Expanded(
                child: SubheadingValueWidget(
                  subheading: "Email",
                  value: "Talhamehtab2014@gmail.com",
                  onTap: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: "Talhamehtab2014@gmail.com",
                    );

                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    } else {
                      throw 'Could not launch $emailUri';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: [
              Expanded(
                child: SubheadingValueWidget(
                  subheading: "Phone No.",
                  value: "+92 336 5434969",
                  onTap: () async {
                    final Uri phoneUri = Uri(
                      scheme: 'tel',
                      path: '+923365434969',
                    );

                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      throw 'Could not launch $phoneUri';
                    }
                  },
                ),
              ),
              const Expanded(
                child: SubheadingValueWidget(
                  subheading: "Freelance",
                  value: "Available",
                ),
              ),
            ],
          ),
        ),
        8.sp.verticalSpace,
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF9800),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
            ),
            onPressed: () async {},
            child: const Text('Book a Meeting'),
          ),
        )
      ],
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
