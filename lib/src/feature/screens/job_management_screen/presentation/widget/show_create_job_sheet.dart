import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/bottom_nav_bar/bottom_sheet_provider.dart';
import 'action_button.dart';
import 'build_text_field.dart';
import 'date_field.dart';
import 'fee_field.dart';
import 'select_status_field.dart';
import 'select_user_field.dart';

void showCreateJobSheet(BuildContext context, WidgetRef ref) {
  ref.read(bottomSheetVisibilityProvider.notifier).state = true;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (context) {
      TextTheme textTheme = Theme.of(context).textTheme;
      return IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(24.r),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          ),
          child: Consumer(
            builder: (context, ref, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create New Job', style: textTheme.titleMedium),
                    SizedBox(height: 24.h),
                    SelectUserField(),
                    SizedBox(height: 24.h),
                    BuildTextField(
                      label: 'Type of Inspection:',
                      hintText: 'HUD-FHA 92051 Compliance - FINAL',
                    ),
                    SizedBox(height: 24.h),
                    BuildTextField(label: 'Address:', hintText: 'Enter address'),
                    SizedBox(height: 24.h),
                    BuildTextField(label: 'FHA Number:', hintText: '123796'),
                    SizedBox(height: 24.h),
                    DateFields(),
                    SizedBox(height: 24.h),
                    SelectStatusField(),
                    SizedBox(height: 24.h),
                    FeeField(label: 'Standard Fee', isChecked: true),
                    SizedBox(height: 10.h),
                    FeeField(label: 'Rush Fee', isChecked: false),
                    SizedBox(height: 10.h),
                    FeeField(label: 'Occupied Fee', isChecked: false),
                    SizedBox(height: 10.h),
                    FeeField(label: 'Long Range Fee', isChecked: true),
                    SizedBox(height: 10.h),
                    ActionButtons(),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  ).whenComplete(() {
    ref.read(bottomSheetVisibilityProvider.notifier).state = false;
  });
}