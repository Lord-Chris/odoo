import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/shared/constants/_constants.dart';
import 'ui/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, _) {
        return MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          home: const HomeView(),
        );
      },
    );
  }
}
