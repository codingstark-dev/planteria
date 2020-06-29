import 'package:flutter/material.dart';
import 'package:planteria/scan_files/after_scanning.dart';
import 'package:planteria/scan_files/loading_scan.dart';
import 'package:planteria/scan_files/wrong_qr.dart';
import 'package:velocity_x/velocity_x.dart';


enum ScanStatus{
  loading,
  resultError,
  noError
}

class ProcessingQR extends StatefulWidget {
  final String result;
  ProcessingQR({this.result});
  @override
  _ProcessingQRState createState() => _ProcessingQRState();
}

class _ProcessingQRState extends State<ProcessingQR> {
ScanStatus _scanStatus;

void process(){
  print(widget.result);
  try {
     _scanStatus = ScanStatus.noError;
    
  } catch (e) {
  }
}



@override
  void initState() {
    process();
  }



  @override
  Widget build(BuildContext context) {
    switch (_scanStatus) {
      case ScanStatus.loading: return LoadingScan();
        break;
      case ScanStatus.resultError: return WrongQr() ;
        break;
       case ScanStatus.noError: return AfterScanning();
    }
  }
}