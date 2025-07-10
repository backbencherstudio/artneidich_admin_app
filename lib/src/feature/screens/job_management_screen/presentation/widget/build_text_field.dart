import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildTextField extends StatelessWidget {
  final String label;
  final String hintText;

  const BuildTextField({super.key, required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 10.h),
        TextFormField(decoration: InputDecoration(hintText: hintText)),
      ],
    );
  }
}
