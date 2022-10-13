import 'package:ecom/controllers/app_state.dart';
import 'package:ecom/views/login_screen/login_screen.dart';
import 'package:ecom/views/onboarding_screen/onboarding_screen.dart';
import 'package:ecom/views/register_screen/register_screen.dart';
import 'package:ecom/views/reset_password/reset_password_screen.dart';
import 'package:ecom/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../views/home_screen.dart';

/// Navigator 2.0, how to use?g
/// https://pub.dev/documentation/go_router/latest/
///
/// gorouter.dev (Ngta đang update document nên tạm coi link trên nha
/// tại go_router mới migrate lên 5.)
class MyRouter {
  final AppState appState;
  MyRouter(this.appState);
  late GoRouter myRouter = GoRouter(
    refreshListenable: appState,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) =>
            state.namedLocation(SplashScreen.routeName),
      ),
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        pageBuilder: (context, state) => SplashScreen.page(),
      ),
      GoRoute(
        path: '/onboarding',
        name: OnboardingScreen.routeName,
        pageBuilder: (context, state) => OnboardingScreen.page(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        pageBuilder: (context, state) => LoginScreen.page(),
      ),
      GoRoute(
        path: '/register',
        name: RegisterScreen.routeName,
        pageBuilder: (context, state) => RegisterScreen.page(),
      ),
      GoRoute(
        path: '/reset',
        name: ResetPassword.routeName,
        pageBuilder: (context, state) => ResetPassword.page(),
      ),
      GoRoute(
        path: '/home',
        name: HomeScreen.routeName,
        pageBuilder: (context, state) => HomeScreen.page(),
      )
    ],
    redirect: (context, state) {
      if (state.subloc == '/splash' && !appState.isSplashScreenDone) {
        appState.initializedApp();
        return null;
      }
      if (state.subloc == '/splash' &&
          appState.isSplashScreenDone &&
          !appState.isOnboardingSceenDone) {
        appState.onBoaringScreenProcess();
        return state.namedLocation(OnboardingScreen.routeName);
      }
      return null;
    },
  );
}
