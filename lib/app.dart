import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';
import 'presentation/pages/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Hadist Pedia',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              tertiary: AppColors.tertiary,
              surface: AppColors.surface,
            ),
            scaffoldBackgroundColor: AppColors.surface,
          ),
          home: const MainScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
