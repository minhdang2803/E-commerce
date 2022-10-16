import 'package:ecom/controllers/controllers.dart';
import 'package:ecom/utils/utils.dart';
import 'package:ecom/views/home_screen/home_component/home_component.dart';
import 'package:ecom/views/home_screen/product_component/product_component.dart';
import 'package:ecom/views/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../theme/app_color.dart';
import 'account_Component/account_component.dart';
import 'card_component/card_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //
  static const String routeName = 'HomeScreen';
  //
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
    //Product
    const ProductComponent(),
    //Order/Cart
    const CartComponent(),
    //Account
    const AccountComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: [
      //   IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Provider.of<LoginProvider>(context, listen: false).logoutGoogle();
      //       SharedPref.instance.remove('isLoggedIn');
      //       context.goNamed(OnboardingScreen.routeName);
      //     },
      //   )
      // ]),
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _currentIndex,
        children: page,
      ),
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
            label: 'Cart',
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
