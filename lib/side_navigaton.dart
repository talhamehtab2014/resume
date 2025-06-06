import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:Personal_Portfolio/controller/side_navigation_controller.dart';
import 'package:Personal_Portfolio/divider.dart';
import 'package:Personal_Portfolio/sections/about.dart';
import 'package:Personal_Portfolio/sections/contact.dart';
import 'package:Personal_Portfolio/sections/resume.dart';
import 'package:Personal_Portfolio/utils/device_type_enum.dart';
import 'package:url_launcher/url_launcher.dart';

class SideNavigaton extends StatelessWidget {
  final DeviceType deviceType;

  final GlobalKey _section1Key = GlobalKey();
  final GlobalKey _section2Key = GlobalKey();
  final GlobalKey _section3Key = GlobalKey();

  final controller = Get.put(SideNavigationController());
  SideNavigaton({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D21),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF31313A),
        onPressed: () async {
          final Uri url = Uri.parse('https://calendly.com/talhamehtab2014');

          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not launch $url';
          }
        }, // You can change the icon here
        tooltip: 'Book a Meeting',
        child: const Icon(
          Icons.calendar_month,
          color: Color(0xFFFF9800),
        ),
      ),
      body: deviceType == DeviceType.desktop
          ? _buildDesktopView(context)
          : _buildMobileView(context),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Stack(
      children: [
        ParticlesFly(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            connectDots: false,
            onTapAnimation: false,
            enableHover: true,
            isRandSize: true,
            particleColor: const Color(0xFF3B3C45),
            awayAnimationDuration: const Duration(seconds: 10),
            numberOfParticles: 100),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF31313A),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => _buildIconButtion(
                      Icons.person_outlined,
                      "ABOUT",
                      controller.selectedIndex.value == 0,
                      onTap: () {
                        controller.updateIndex(0);
                        _scrollToSection(_section1Key);
                      },
                    ),
                  ),
                  const GradientDivider(),
                  Obx(
                    () => _buildIconButtion(
                      Icons.article_outlined,
                      "RESUME",
                      controller.selectedIndex.value == 1,
                      onTap: () {
                        // if (deviceType == DeviceType.mobile ||
                        //     deviceType == DeviceType.tablet) {
                        //   Get.showSnackbar(const GetSnackBar(
                        //     message: "This feature is not yet available",
                        //     duration: Duration(seconds: 2),
                        //   ));
                        //   return;
                        // }
                        _scrollToSection(_section2Key);
                        controller.updateIndex(1);
                      },
                    ),
                  ),
                  // const GradientDivider(),
                  // Obx(
                  //   () => _buildIconButtion(
                  //     Icons.brush,
                  //     "WORK",
                  //     controller.selectedIndex.value == 2,
                  //     onTap: () {
                  //       if (deviceType == DeviceType.mobile ||
                  //           deviceType == DeviceType.tablet) {
                  //         Get.showSnackbar(const GetSnackBar(
                  //           message: "This feature is not yet available",
                  //           duration: Duration(seconds: 2),
                  //         ));
                  //         return;
                  //       }
                  //       _scrollToSection(_section3Key);
                  //       controller.updateIndex(2);
                  //     },
                  //   ),
                  // ),
                  const GradientDivider(),
                  Obx(() {
                    return _buildIconButtion(
                      Icons.alternate_email,
                      "CONTACT",
                      controller.selectedIndex.value == 2,
                      onTap: () {
                        _scrollToSection(_section3Key);
                        controller.updateIndex(2);
                      },
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF31313A),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ClipPath(
                                clipper: FiveCornerClipper(),
                                child: Image.asset(
                                  'assets/image/header_bg.jpg',
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(-15, 65),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          const Color(0xFFFF9800)
                                              .withOpacity(0.2),
                                          const Color(0xFF31313A),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, 50),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Container(
                                    color: const Color(0xFF31313A),
                                    padding: const EdgeInsets.all(0.5),
                                    child: Image.asset(
                                      'assets/image/pf.jpg',
                                      width: 150,
                                      height: 150,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Text(
                            'Talha Mehtab',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DefaultTextStyle(
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: const Color(0xFFFF9800),
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                TyperAnimatedText(
                                  'Flutter Developer',
                                  speed: const Duration(milliseconds: 70),
                                ),
                                TyperAnimatedText(
                                  'Android Developer',
                                  speed: const Duration(milliseconds: 70),
                                ),
                                TyperAnimatedText(
                                  'Freelancer',
                                  speed: const Duration(milliseconds: 70),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SocialWidget(),
                          SizedBox(
                            height: Get.height * 0.05,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    try {
                                      launchUrll(Uri.parse(
                                          'https://talhaburneyyy.info/assets/assets/resume/resume.pdf'));
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "DOWNLOAD CV",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.download,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const GradientDivider(
                                width: 1.5,
                                height: 50,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF3B3C45),
                                  Color(0xFF31313A),
                                ],
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    _scrollToSection(_section3Key);
                                    controller.updateIndex(2);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "CONTACT ME",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AboutMe(
                      key: _section1Key,
                      deviceType: deviceType,
                    ),
                    Resume(
                      key: _section2Key,
                      deviceType: deviceType,
                    ),
                    ContactMe(
                      key: _section3Key,
                      deviceType: deviceType,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Stack(
      children: [
        ParticlesFly(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            connectDots: false,
            onTapAnimation: false,
            enableHover: true,
            particleColor: const Color(0xFF3B3C45),
            isRandSize: true,
            awayAnimationDuration: const Duration(seconds: 10),
            numberOfParticles: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: Get.width * 0.15,
                  top: Get.height * 0.1,
                  bottom: Get.height * 0.1,
                ),
                color: const Color(0xFF31313A),
                child: Obx(
                  () {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final offsetAnimation = Tween<Offset>(
                          begin: const Offset(
                              -0.5, 0.0), // Slight slide from the left
                          end: Offset.zero,
                        ).animate(animation);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      child: controller.selectedIndex.value == 0
                          ? AboutMe(
                              deviceType: deviceType,
                            )
                          : controller.selectedIndex.value == 1
                              ? Resume(
                                  deviceType: deviceType,
                                )
                              : controller.selectedIndex.value == 2
                                  ? ContactMe(
                                      deviceType: deviceType,
                                    )
                                  : const Center(
                                      child: Text("Error"),
                                    ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  //BackMirrorOfBox
                  Container(
                    margin: EdgeInsets.only(
                      left: Get.width * 0.14,
                      top: Get.height * 0.07,
                      bottom: Get.height * 0.11,
                      right: Get.width * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF232328).withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  //MainBox
                  Container(
                    margin: EdgeInsets.only(
                      left: Get.width * 0.15,
                      top: Get.height * 0.09,
                      bottom: Get.height * 0.09,
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFF31313A),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipPath(
                              clipper: FiveCornerClipper(),
                              child: Image.asset(
                                'assets/image/header_bg.jpg',
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(-15, 65),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        const Color(0xFFFF9800)
                                            .withOpacity(0.2),
                                        const Color(0xFF31313A),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, 50),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                  color: const Color(0xFF31313A),
                                  padding: const EdgeInsets.all(0.5),
                                  child: Image.asset(
                                    'assets/image/pf.jpg',
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Talha Mehtab',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DefaultTextStyle(
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: const Color(0xFFFF9800),
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                'Flutter Developer',
                                speed: const Duration(milliseconds: 70),
                              ),
                              TyperAnimatedText(
                                'Android Developer',
                                speed: const Duration(milliseconds: 70),
                              ),
                              TyperAnimatedText(
                                'Freelancer',
                                speed: const Duration(milliseconds: 70),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SocialWidget(),
                        const Spacer(),
                        GradientDivider(
                          width: Get.width,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: const [
                            Color(0xFF3B3C45),
                            Color(0xFF31313A),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  try {
                                    launchUrll(Uri.parse(
                                        'https://talhaburneyyy.info/assets/assets/resume/resume.pdf'));
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "DOWNLOAD CV",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.download,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const GradientDivider(
                              width: 1.5,
                              height: 50,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF3B3C45),
                                Color(0xFF31313A),
                              ],
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.updateIndex(2);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "CONTACT ME",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: (Get.width * 0.09),
          top: (Get.height * 0.1),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF31313A),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => _buildIconButtion(
                    Icons.person_outlined,
                    "ABOUT",
                    controller.selectedIndex.value == 0,
                    onTap: () {
                      controller.updateIndex(0);
                    },
                  ),
                ),
                const GradientDivider(),
                Obx(
                  () => _buildIconButtion(
                    Icons.article_outlined,
                    "RESUME",
                    controller.selectedIndex.value == 1,
                    onTap: () {
                      controller.updateIndex(1);
                    },
                  ),
                ),
                // const GradientDivider(),
                // Obx(
                //   () => _buildIconButtion(
                //     Icons.brush,
                //     "WORK",
                //     controller.selectedIndex.value == 2,
                //     onTap: () {
                //       controller.updateIndex(2);
                //     },
                //   ),
                // ),
                const GradientDivider(),
                Obx(() {
                  return _buildIconButtion(
                    Icons.alternate_email,
                    "CONTACT",
                    controller.selectedIndex.value == 2,
                    onTap: () {
                      controller.updateIndex(2);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButtion(IconData icon, String buttonText, bool isSelected,
      {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? const Color(0xFFFF9800) : Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              buttonText,
              style: GoogleFonts.poppins(
                color: isSelected ? const Color(0xFFFF9800) : Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    if (deviceType == DeviceType.desktop) {
      return;
    }
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> launchUrll(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  SocialWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          hoverColor: const Color(0xFFFF9800),
          onPressed: () {
            try {
              launchUrll(Uri.parse('https://www.facebook.com/talhaburneyyy'));
            } catch (e) {
              print(e);
            }
          },
          icon: Image.asset(
            'assets/icons/facebook.png',
            width: 18,
            height: 18,
            color: const Color(0xFFA2A2A6),
          ),
        ),
        IconButton(
          hoverColor: const Color(0xFFFF9800),
          onPressed: () {
            try {
              launchUrll(Uri.parse('https://x.com/talhaburneyy?s=01'));
            } catch (e) {
              print(e);
            }
          },
          icon: Image.asset(
            'assets/icons/twitter.png',
            width: 18,
            height: 18,
            color: const Color(0xFFA2A2A6),
          ),
        ),
        IconButton(
          hoverColor: const Color(0xFFFF9800),
          onPressed: () {
            try {
              launchUrll(Uri.parse('https://github.com/talhamehtab2014'));
            } catch (e) {
              print(e);
            }
          },
          icon: Image.asset(
            'assets/icons/github.png',
            width: 18,
            height: 18,
            color: const Color(0xFFA2A2A6),
          ),
        ),
        IconButton(
          hoverColor: const Color(0xFFFF9800),
          onPressed: () {
            try {
              launchUrll(Uri.parse('https://www.instagram.com/talhaburneyyy'));
            } catch (e) {
              print(e);
            }
          },
          icon: Image.asset(
            'assets/icons/social.png',
            width: 18,
            height: 18,
            color: const Color(0xFFA2A2A6),
          ),
        ),
        IconButton(
          hoverColor: const Color(0xFFFF9800),
          onPressed: () {
            try {
              launchUrll(Uri.parse('https://www.linkedin.com/in/talha-mehtab'));
            } catch (e) {
              print(e);
            }
          },
          icon: Image.asset(
            'assets/icons/linkedin.png',
            width: 18,
            height: 18,
            color: const Color(0xFFA2A2A6),
          ),
        ),
      ],
    );
  }
}

class FiveCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Define 5 custom corners
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
