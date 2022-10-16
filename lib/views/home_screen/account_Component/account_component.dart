import 'package:flutter/material.dart';

class AccountComponent extends StatefulWidget {
  const AccountComponent({super.key});

  @override
  State<AccountComponent> createState() => _AccountComponentState();
}

class _AccountComponentState extends State<AccountComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Account '),
      ),
    );
  }
}
