import 'package:flutter/material.dart';

class AfterScanning extends StatefulWidget {
  @override
  _AfterScanningState createState() => _AfterScanningState();
}

class _AfterScanningState extends State<AfterScanning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("After scanning")
        ),
      ),
    );
  }
}