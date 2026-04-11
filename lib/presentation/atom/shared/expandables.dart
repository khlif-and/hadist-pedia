import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableText extends StatefulWidget {
  final String label;
  final String text;
  final bool isArabic;

  const ExpandableText({
    Key? key,
    required this.label,
    required this.text,
    this.isArabic = false,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.text,
            style: widget.isArabic
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    height: 1.8,
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold,
                  )
                : TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 15.sp,
                    height: 1.5,
                  ),
            textAlign: widget.isArabic ? TextAlign.right : TextAlign.left,
            textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
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
