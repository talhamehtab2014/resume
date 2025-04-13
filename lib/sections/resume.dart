import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_html/divider.dart';
import 'package:resume_html/sections/contact.dart';
import 'package:resume_html/utils/device_type_enum.dart' as DV;

class Resume extends StatelessWidget {
  final DV.DeviceType deviceType;
  static const id = '/resume';
  const Resume({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return deviceType == DV.DeviceType.desktop
        ? Scaffold(
            backgroundColor: Colors.transparent,
            body: RawScrollbar(
              thumbColor: const Color(0xFFFF9800),
              child: SingleChildScrollView(
                child: pageContent(),
              ),
            ))
        : pageContent();
  }

  Column pageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Heading(
            coloredText: "R",
            normalText: "esume",
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
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _experienceWidet(),
                ),
                const GradientDivider(
                  width: 0.5,
                  height: 320,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3B3C45),
                    Color(0xFF31313A),
                  ],
                ),
                Expanded(
                  child: _educationWidet(),
                ),
              ],
            ),
          ),
        ),
        8.sp.verticalSpace,
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Heading(
            coloredText: "My ",
            normalText: "Skills",
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
        8.sp.verticalSpace,
        _mySkillsWidget(),
        8.sp.verticalSpace,
      ],
    );
  }

  _educationWidet() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headingIconWidget(Icons.school, "Education".toUpperCase()),
          8.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          8.sp.verticalSpace,
          ..._educationItemWidget(
            year: "2020 - 2024",
            title: "BS Computer Science",
            subTitle: "BIIT, Rawalpindi",
          ),
          4.sp.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          4.sp.verticalSpace,
          ..._educationItemWidget(
            year: "2013 - 2015",
            title: "ICS",
            subTitle: "Punjab College, Rawalpindi",
          ),
          4.sp.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          4.sp.verticalSpace,
          ..._educationItemWidget(
            year: "2011 - 2013",
            title: "Computer Science",
            subTitle: "FG Quaid-e-Azam, Rawalpindi",
          ),
        ],
      ),
    );
  }

  _experienceWidet() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headingIconWidget(Icons.work, "Experience".toUpperCase()),
          8.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          8.sp.verticalSpace,
          ..._educationItemWidget(
              year: "Nov 2023 - Present",
              title: "Flutter Developer",
              subTitle: "Veroke, Islamabad.",
              desc:
                  "Working on different kind of Cross Platform applications mainly on Utility & Fin-Tech kind of apps."),
          4.sp.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          4.sp.verticalSpace,
          ..._educationItemWidget(
            year: "Feb 2021 - Nov 2023",
            title: "Android Developer",
            subTitle: "Veroke, Islamabad.",
            desc:
                "Working on different kind of android applications mainly on E-Commerce & Fin-Tech kind of apps.",
          ),
        ],
      ),
    );
  }

  _mySkillsWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _headingIconWidget(Icons.code, "Coding".toUpperCase()),
          8.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          8.sp.verticalSpace,
          Wrap(
            spacing: 32,
            runSpacing: 24,
            children: [
              _progressIndicatorWidget(75, "Flutter"),
              _progressIndicatorWidget(85, "Android"),
              _progressIndicatorWidget(90, "Java"),
              _progressIndicatorWidget(90, "Dart"),
              _progressIndicatorWidget(50, "Kotlin"),
            ],
          ),
          8.sp.verticalSpace,
          _headingIconWidget(Icons.bubble_chart, "Others".toUpperCase()),
          8.verticalSpace,
          GradientDivider(
            width: Get.width,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3B3C45),
              Color(0xFF31313A),
            ],
          ),
          8.sp.verticalSpace,
          Wrap(
            spacing: 32,
            runSpacing: 24,
            children: [
              _progressIndicatorWidget(75, "GIT"),
              _progressIndicatorWidget(60, "Dsign Patterns"),
            ],
          ),
        ],
      ),
    );
  }

  _educationItemWidget(
      {required String year,
      required String title,
      required String subTitle,
      String? desc}) {
    return [
      Container(
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFA2A2A6),
          ),
        ),
        child: Text(
          year,
          style: GoogleFonts.poppins(
            color: const Color(0xFFA2A2A6),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      3.sp.verticalSpace,
      Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        subTitle,
        style: GoogleFonts.poppins(
          color: const Color(0xFFA2A2A6),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      if (desc != null) 2.sp.verticalSpace,
      if (desc != null)
        Text(
          desc,
          style: GoogleFonts.poppins(
            color: const Color(0xFFA2A2A6),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
    ];
  }

  _headingIconWidget(iconData, title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 12.sp,
          color: const Color(0xFFFF9800),
        ),
        4.horizontalSpace,
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  _progressIndicatorWidget(int percentage, String skillName) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 20.sp,
              height: 20.sp,
              child: CircularProgressIndicator(
                value: (percentage / 100),
                backgroundColor: const Color(0xFF3B3C45),
                color: const Color(0xFFFF9800),
                strokeWidth: 2.sp,
              ),
            ),
            Text(
              "$percentage%",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        3.sp.verticalSpace,
        Text(
          skillName,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
