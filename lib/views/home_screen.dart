import 'package:ecom/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';
  static MaterialPage page() {
    return MaterialPage(
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
      child: Text('Hello'),
    )));
  }
}
