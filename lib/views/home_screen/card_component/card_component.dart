import 'package:flutter/material.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({super.key});

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Cart'),
      ),
    );
  }
}
