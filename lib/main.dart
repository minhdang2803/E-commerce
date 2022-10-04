import 'package:ecom/controllers/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(MultiProvider(
    providers: [Provider(create: (context) => MyRouter())],
    child: const ECom(),
  ));
}

class ECom extends StatelessWidget {
  const ECom({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Provider.of<MyRouter>(context, listen: false).myRouter;
    return MaterialApp.router(
      title: 'Ecom',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
