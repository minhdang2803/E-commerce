import 'package:ecom/views/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../controllers/login_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';
  static MaterialPage page() {
    return const MaterialPage(
      child: HomeScreen(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColor.primary,
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          Text('Hello'),
          TextButton(
              onPressed: () {
                Provider.of<LoginProvider>(context, listen: false)
                    .logoutGoogle();
                context.goNamed(OnboardingScreen.routeName);
              },
              child: Text('logout'))
        ],
      ),
    )));
  }
}
