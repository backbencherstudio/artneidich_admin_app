
import 'package:artneidich_admin/src/core/routes/route_config.dart';
import 'package:artneidich_admin/src/core/theme/app_theme.dart';
import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Set device orientation to portrait
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();
  setPathUrlStrategy();
  runApp(ProviderScope(child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      systemNavigationBarColor: Colors.transparent, // Transparent nav bar
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double deviceWidth = 390.0;
  static const double deviceHeight = 840.0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(deviceWidth, deviceHeight),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Artneidich',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: RouteConfig().goRouter,
        );
      },
    );
  }
}
