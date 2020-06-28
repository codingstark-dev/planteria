import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      preferredSize: Size(100, 50),
    );
  }
}
