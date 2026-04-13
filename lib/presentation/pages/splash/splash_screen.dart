import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/common/utils/manager/cache_manager.dart';
import 'package:hadist_pedia/presentation/common/utils/database/app_database.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _preloadAndNavigate();
  }

  Future<void> _preloadAndNavigate() async {
    await Future.wait([
      CacheManager().preloadPools(),
      Future(() => AppDatabase.instance),
    ]);
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/gradient_night.webp',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 500.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.95),
                    Colors.black.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFECAAA1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.blur_on,
                        color: Colors.black,
                        size: 28.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      'ROUTEMIND',
                      style: TextStyle(
                        fontSize: 68.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        height: 1.0,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Welcome to RouteMind',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Your Adventure\nStarts Here',
                    style: TextStyle(
                      fontSize: 42.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Discover top places, plan your perfect route,\ntravel easily and stress-free.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: OutlinedButton(
                      onPressed: () {
                        context.go('/home');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white54, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        backgroundColor: const Color(
                          0xFF1A1A1A,
                        ).withValues(alpha: 0.6),
                      ),
                      child: Text(
                        "Let's start",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
