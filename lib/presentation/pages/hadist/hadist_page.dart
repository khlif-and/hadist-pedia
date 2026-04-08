import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadistPage extends StatelessWidget {
  const HadistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 450.h,
            child: Image.network(
              'https://picsum.photos/800/600',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 24.r,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    top: 24.h,
                    bottom: MediaQuery.of(context).padding.bottom + 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40.w,
                          height: 4.h,
                          margin: EdgeInsets.only(bottom: 24.h),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      Text(
                        'Keutamaan Menuntut Ilmu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD4E99C),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'Shahih',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'HR. Ibnu Majah',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        height: 72.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          children: [
                            _buildInfoCard('Kategori', 'Ilmu'),
                            SizedBox(width: 12.w),
                            _buildInfoCard('Perawi', 'Anas bin Malik'),
                            SizedBox(width: 12.w),
                            _buildInfoCard('Kitab', 'Sunan Ibnu Majah'),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        'طَلَبُ الْعِلْمِ فَرِيضَةٌ عَلَى كُلِّ مُسْلِمٍ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          height: 1.8,
                          fontFamily: 'Amiri', // Atau font Arab pilihanmu
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 24.h),
                      const _ExpandableText(
                        label: 'Latin',
                        text: 'Thalabul \'ilmi fariidhatun \'alaa kulli muslimin.',
                      ),
                      SizedBox(height: 16.h),
                      const _ExpandableText(
                        label: 'Terjemahan',
                        text: '"Menuntut ilmu itu wajib atas setiap muslim."',
                      ),
                      SizedBox(height: 16.h),
                      const _ExpandableText(
                        label: 'Kandungan Hadist',
                        text: 'Hadist ini menjelaskan bahwa menuntut ilmu, khususnya ilmu syar\'i yang berkaitan dengan fardhu ain (seperti tauhid, tata cara shalat, puasa, dan kewajiban dasar lainnya), adalah sebuah kewajiban mutlak bagi setiap individu muslim, baik laki-laki maupun perempuan. Kewajiban ini tidak bisa diwakilkan dan harus diupayakan agar ibadah yang dilakukan sah dan diterima oleh Allah SWT.',
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        'Related Hadist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 230.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 240.w,
                              margin: EdgeInsets.only(right: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16.r),
                                        child: Image.network(
                                          'https://picsum.photos/400/300?random=$index',
                                          height: 150.h,
                                          width: 240.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 12.h,
                                        right: 12.w,
                                        child: CircleAvatar(
                                          radius: 16.r,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.arrow_outward,
                                            color: Colors.black,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    'Jalan Menuju Surga',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'HR. Muslim',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandableText extends StatefulWidget {
  final String label;
  final String text;

  const _ExpandableText({Key? key, required this.label, required this.text}) : super(key: key);

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.85),
            fontSize: 15.sp,
            height: 1.5,
          ),
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Read less' : 'Read more',
            style: TextStyle(
              color: const Color(0xFFD4E99C),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}