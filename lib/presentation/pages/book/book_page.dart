import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13131A),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://picsum.photos/800/1000',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xFF13131A), // Bawah full pekat
                        const Color(0xFF13131A).withOpacity(0.95), // Tengah hampir pekat
                        const Color(0xFF13131A).withOpacity(0.85), // Atas lebih gelap
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 120.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.15),
                          radius: 22.r,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.15),
                          radius: 22.r,
                          child: IconButton(
                            icon: const Icon(Icons.bookmark, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 12.w),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.15),
                          radius: 22.r,
                          child: IconButton(
                            icon: const Icon(Icons.more_vert, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Container(
                      width: 280.w,
                      height: 280.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.r),
                        child: Image.network(
                          'https://picsum.photos/400/400',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Sleeping Beauty',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Georgia',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '64%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Charles Perrault',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        _buildStatItem(Icons.star, '4.7', iconColor: const Color(0xFFFFD700)),
                        SizedBox(width: 20.w),
                        _buildStatItem(Icons.remove_red_eye_outlined, '34.9k'),
                        SizedBox(width: 20.w),
                        _buildStatItem(Icons.bookmark_border, '2.4k'),
                        SizedBox(width: 20.w),
                        _buildStatItem(Icons.chat_bubble_outline, '800'),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Sleeping Beauty is a classic fairy tale about a princess cursed to fall into a deep sleep for a hundred years, only to be awakened by true love\'s kiss. The story explores themes of destiny, magic, and the triumph of good over evil.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 15.sp,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 20.h,
                bottom: MediaQuery.of(context).padding.bottom + 20.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF13131A),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.08),
                    width: 1,
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 60.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFAF1A2),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue reading',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, {Color? iconColor}) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Colors.white.withOpacity(0.5),
          size: 18.sp,
        ),
        SizedBox(width: 6.w),
        Text(
          value,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}