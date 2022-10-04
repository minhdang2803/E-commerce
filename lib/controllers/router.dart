import 'package:go_router/go_router.dart';

import '../views/home_screen.dart';

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
