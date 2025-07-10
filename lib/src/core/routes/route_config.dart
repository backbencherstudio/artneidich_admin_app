import 'package:artneidich_admin/src/core/routes/route_constant.dart';
import 'package:artneidich_admin/src/feature/common_widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:artneidich_admin/src/feature/screens/Home/presentation/home_screen.dart';
import 'package:artneidich_admin/src/feature/screens/auth/forget_password_screen/presentation/forget_passwrod_screen.dart';
import 'package:artneidich_admin/src/feature/screens/auth/otp_screen/presentation/otp_screen.dart';
import 'package:artneidich_admin/src/feature/screens/auth/sign_in_screen/presentation/sign_in_screen.dart';
import 'package:artneidich_admin/src/feature/screens/job_management_screen/presentation/job_management_screen.dart';
import 'package:artneidich_admin/src/feature/screens/label_management_screens/presentation/label_management_screen.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/change_password_screen/presentation/change_password_screen.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/edit_profile_screen/presentation/edit_profile_screen.dart';
import 'package:artneidich_admin/src/feature/screens/profile_settings/profile_settings_screen/presentation/profile_settings_screen.dart';
import 'package:artneidich_admin/src/feature/screens/splash/splash_screen.dart';
import 'package:artneidich_admin/src/feature/screens/user_Managment/presentation/user_mgmt_screen.dart';
import 'package:go_router/go_router.dart';
import '../../feature/screens/auth/forget_password_screen/presentation/password_reset_screen.dart';
import '../../feature/screens/auth/otp_screen/model/otp_screen_parameter_model.dart';
import '../../feature/screens/auth/sign_up_screen/presentation/sign_up_screen.dart';
import '../../feature/screens/auth/successful_screen/successful_screen.dart';
import 'build_page_with_transition.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteConst.splash,

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
                builder: (context, state) => const LabelManagementScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConst.settingScreen,
                builder: (context, state) => const ProfileSettingScreen(),
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
<<<<<<< HEAD
        },
      ),
      GoRoute(
        path: RouteConst.labelManagementScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: LabelManagementScreen(),
          );
        },
      ),
=======
        },*/
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


      GoRoute(
        path: RouteConst.signInScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: SignInScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteConst.forgetPasswordScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: ForgetPasswordScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteConst.otpVerificationScreen,
        pageBuilder: (context, state) {
          final otpParameterModel = state.extra as OtpParameterModel;
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: OtpScreen(otpParameterModel: otpParameterModel),
          );
        },
      ),

      GoRoute(
        path: RouteConst.passwordResetScreen,
        pageBuilder: (context, state) {
          final otpParameterModel = state.extra as OtpParameterModel;
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: PasswordResetScreen(otpParameterModel: otpParameterModel),
          );
        },
      ),

      GoRoute(
        path: RouteConst.successfulScreen,
        pageBuilder: (context, state) {
          final otpParameterModel = state.extra as OtpParameterModel;
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: SuccessfulScreen(otpParameterModel: otpParameterModel),
          );
        },
      ),
      GoRoute(
        path: RouteConst.signUpScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideBottomToTop,
            child: SignUpScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteConst.splash,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideBottomToTop,
            child: SplashScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteConst.editProfileScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideBottomToTop,
            child: EditProfileScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteConst.changePasswordScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideBottomToTop,
            child: ChangePasswordScreen(),
          );
        },
      ),


    ],
  );
}
