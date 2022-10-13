import 'package:ecom/controllers/app_state.dart';
import 'package:ecom/controllers/controllers.dart';
import 'package:ecom/controllers/register_provider.dart';
import 'package:ecom/controllers/router.dart';
import 'package:ecom/theme/app_theme.dart';
import 'package:ecom/utils/restart_util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Ensure that the application Initialized successfully
  WidgetsFlutterBinding.ensureInitialized();

  // Connect to Firebase project
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Print path of pages in debug console
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  // Run application
  final appState = AppState();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => appState),
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      Provider(create: (context) => MyRouter(appState)),
    ],
    child: const ECom(),
  ));
}

class ECom extends StatefulWidget {
  const ECom({super.key});

  @override
  State<ECom> createState() => _EComState();
}

class _EComState extends State<ECom> {
  @override
  Widget build(BuildContext context) {
    final router = Provider.of<MyRouter>(context, listen: false).myRouter;
    return RestartWidget(
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Ecom',
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
