
import 'package:artneidich_admin/src/core/routes/route_constant.dart';
import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/home_screen.dart';
import 'package:artneidich_admin/src/feature/screens/job_management_screen/presentation/job_management_screen.dart';
import 'package:artneidich_admin/src/feature/screens/label_management/label_management.dart';
import 'package:artneidich_admin/src/feature/screens/profile_setting/profile_settings_screen.dart';
import 'package:artneidich_admin/src/feature/screens/user_Managment/presentation/user_mgmt_screen.dart';
import 'package:go_router/go_router.dart';

import 'build_page_with_transition.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteConst.jobManagementScreen,

    routes: [
      
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConst.homeScreen,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConst.usersManagementScreen,
                builder: (context, state) => const UserMgmtScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConst.jobManagementScreen,
                builder: (context, state) => const JobManagementScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConst.labelManagementScreen,
                builder: (context, state) => const LabelManagement(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConst.settingScreen,
                builder: (context, state) => const ProfileSettingsScreen(),
              ),
            ],
          ),
        ],
      ),

      /*GoRoute(
        path: RouteConst.homeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: HomeScreen(),
          );
        },
      ),*/
    ]);
    
}
