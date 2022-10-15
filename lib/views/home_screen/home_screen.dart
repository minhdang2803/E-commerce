import 'package:ecom/views/home_screen/home_component.dart';
import 'package:flutter/material.dart';
import '../../theme/app_color.dart';

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
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> page = [
    const HomeComponent(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryDarker,
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/home_screen/ic-home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/home_screen/ic-product.png'),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/home_screen/ic-list.png'),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/home_screen/ic-user.png'),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
