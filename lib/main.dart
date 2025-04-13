import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:resume_html/firebase_options.dart';
import 'package:resume_html/side_navigaton.dart';
import 'package:resume_html/utils/device_type_enum.dart' as dv;

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        title: 'Talha Mehtab - Resume',
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => 'Talha Mehtab - Resume',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                child: width >= 1024
                    ? SideNavigaton(
                        deviceType: dv.DeviceType.desktop,
                      )
                    : SideNavigaton(
                        deviceType: dv.DeviceType.mobile,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
