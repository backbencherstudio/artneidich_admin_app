
import 'package:artneidich_admin/src/core/routes/route_constant.dart';
import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/home_screen.dart';
import 'package:artneidich_admin/src/feature/screens/user_Managment/presentation/user_mgmt_screen.dart';
import 'package:go_router/go_router.dart';

import 'build_page_with_transition.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteConst.homeScreen,

    routes: [
      
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) =>
      //       BottomNavBar(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.homeScreen,
      //           builder: (context, state) => const HomeScreenViewer(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.jobScreen,
      //           builder: (context, state) => const JobScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.mapScreen,
      //           builder: (context, state) => const MapScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.settingScreen,
      //           builder: (context, state) => const ProfileSettingScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      GoRoute(
        path: RouteConst.homeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: HomeScreen(),
          );
        },
      ),
  
   GoRoute(
        path: RouteConst.userMgmScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: UserMgmtScreen(),
          );
        },
      ),
  
  
  
  
    ]
    
    
    );
    
}
