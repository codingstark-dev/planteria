import 'package:flutter/material.dart';
import 'package:planteria/screen/Home.dart';
import 'package:planteria/service/locator.dart';

void main() {
  serviceLocator();
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
