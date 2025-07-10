import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSticker extends StatelessWidget {
  final Color color;
  final String icon;
  const CustomSticker({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Padding(
        padding: const EdgeInsets.all(8.25),
        child: SvgPicture.asset(icon,
        height: 16.h,
        width: 16.w,
        ),
      ),
    );
  }
}
