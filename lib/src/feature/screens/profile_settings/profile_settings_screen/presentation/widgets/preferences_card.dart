// import 'package:artneidich/src/core/constant/icons.dart';
// import 'package:artneidich/src/feature/screens/profile_settings/profile_settings_screen/presentation/widgets/custom_list_tile/custom_list_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../riverpod/notification_setting_provider/notification_setting_provider.dart';
//
// class PreferencesCard extends StatelessWidget{
//   const PreferencesCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16.r),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 16.h,
//         children: [
//           Text("Preferences",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),),
//           CustomListTile(
//               leadingIconPath: AppIcons.notificationOutline,
//               title: "Notifications",
//             trailingWidget: Consumer(
//               builder: (_, ref, _) {
//                 final notificationSetting = ref.watch(notificationSettingProvider);
//                 return Switch(value: notificationSetting, onChanged: (value)=>ref.read(notificationSettingProvider.notifier).toggleNotification(value));
//               }
//             ),
//           ),
//           // CustomListTile(
//           //   leadingIconPath: AppIcons.notificationOutline,
//           //   title: "Notifications",
//           //   trailingText: "English",
//           //
//           // ),
//         ],
//       ),
//     );
//   }
// }