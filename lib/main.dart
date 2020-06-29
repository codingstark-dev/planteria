import 'package:flutter/material.dart';
import 'package:planteria/screen/option_page.dart';
import 'package:planteria/service/locator.dart';

void main() {
  serviceLocator();
  runApp(MaterialApp(
    home: OptionPage(),
    debugShowCheckedModeBanner: false,
  ));
}
