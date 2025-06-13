import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controllers/main_controller.dart';
import 'views/main_view.dart';
import 'utils/app_colors.dart';

void main() {
  Get.put(MainController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Portfolio App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
          home: MainView(),
        );
      },
    );
  }
}
