import 'package:artneidich_admin/src/core/constant/padding.dart';
import 'package:artneidich_admin/src/feature/screens/label_management_screens/presentation/widgets/add_new_label_bottom_sheet.dart';
import 'package:artneidich_admin/src/feature/screens/label_management_screens/presentation/widgets/label_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../common_widgets/commonWidget.dart';
import '../../../common_widgets/floating_action_button/custom_floating_action_button.dart';

class LabelManagementScreen extends StatelessWidget {
  const LabelManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(onTap: () {
        createNewLabelBottomSheet(context: context);
      }),
      body: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            CommonWidget.appBar(title: "User List"),
            SizedBox(height: 16.h),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: SvgPicture.asset(AppIcons.search),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  return LabelCard(
                    index: index + 1,
                    label: "Exterior Left Elevation",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
