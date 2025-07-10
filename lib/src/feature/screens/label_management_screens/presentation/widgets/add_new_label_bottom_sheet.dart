import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Future<void> createNewLabelBottomSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final textTheme = Theme.of(context).textTheme;
      return IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) ,
          child: Container(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h,  bottom: 28.h),
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r),
            color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text("Create New Label",style: textTheme.titleMedium,),
                SizedBox(height: 16.h),
                Text("Name :"),
                SizedBox(height: 6.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter name"
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffECEFF3),
                          foregroundColor: Color(0xff4A4C56),
                        ),
                        onPressed: ()=> context.pop(),
                        child: Text("Cancel"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: ()=> context.pop(),
                        child: Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
