import 'package:go_router/go_router.dart';

import '../views/home_screen.dart';

/// Navigator 2.0, how to use?g
/// https://pub.dev/documentation/go_router/latest/
/// 
/// gorouter.dev (Ngta đang update document nên tạm coi link trên nha
/// tại go_router mới migrate lên 5.)
class MyRouter {
  final myRouter = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => state.namedLocation(HomeScreen.routeName),
      ),
      GoRoute(
        path: '/home',
        name: HomeScreen.routeName,
        pageBuilder: (context, state) => HomeScreen.page(),
      )
    ],
  );
}
