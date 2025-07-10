import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/theme_extension/color_pallete.dart';

class CustomRowText extends StatelessWidget {
  final String title;
  final String discription;
  const CustomRowText({super.key,
  required this.title,
  required this.discription,
  
  });

  @override
  Widget build(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Expanded(
          child: Text(title,
             style: textTheme.labelLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryTextColor,)
          ),
        ),
    
        SizedBox(width: 24.w,),
        Expanded(
          child: Text(discription,
          textAlign: TextAlign.left,
          style: textTheme.labelLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryTextColor,)
          
          ),
        ),
       ],
    );
  }
}