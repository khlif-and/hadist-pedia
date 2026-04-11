import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../atom/hadist/card_litte_container.dart';

class IsnadHadist extends StatelessWidget {
  final Map<String, dynamic> isnad;

  const IsnadHadist({Key? key, required this.isnad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sanad Hadist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        if (isnad['chain_summary'] != null)
          Text(
            "Jalur: ${isnad['chain_summary']}",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        if (isnad['chain_length'] != null)
          Text(
            "Panjang Sanad: ${isnad['chain_length']} perawi",
            style: TextStyle(
              color: const Color(0xFFD4E99C),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        SizedBox(height: 16.h),
        if (isnad['narrators'] != null)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isnad['narrators'].length,
            itemBuilder: (context, index) {
              final n = isnad['narrators'][index];
              return CardLittleContainer(
                margin: EdgeInsets.only(bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${n['level']}. ${n['name'] ?? ''}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (n['name_arabic'] != null)
                          Text(
                            n['name_arabic'],
                            style: TextStyle(
                              color: const Color(0xFFD4E99C),
                              fontSize: 16.sp,
                              fontFamily: 'Amiri',
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    if (n['role'] != null)
                      Text(
                        "Peran: ${n['role']}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13.sp,
                        ),
                      ),
                    if (n['status'] != null)
                      Text(
                        "Status: ${n['status']}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13.sp,
                        ),
                      ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        if (n['born'] != null)
                          Expanded(
                            child: Text(
                              "Lahir: ${n['born']}",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        if (n['died'] != null)
                          Expanded(
                            child: Text(
                              "Wafat: ${n['died']}",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
