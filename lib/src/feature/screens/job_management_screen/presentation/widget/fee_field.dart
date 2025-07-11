import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/circle_check_box/circle_ckeckBoc.dart';
class FeeField extends StatelessWidget {
  final String label;
  final bool isChecked;

  const FeeField({required this.label, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleCheckbox(value: isChecked, onChanged: (val) {}),
            SizedBox(width: 10.w),
            Text(label),
            SizedBox(width: 10.w),
          ],
        ),
        SizedBox(
          width: 100.w,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Price(\$) ',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              border: UnderlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
