import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planteria/scan_files/process_qr.dart';

class ScanQr{
  final BuildContext context;
  ScanQr({this.context});

  var result;
  Future scanQRFunction() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      result = qrResult.rawContent;
          print("result is: $result");
            if(result!=""){          
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> ProcessingQR(result: result,) ));
    
              }
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
      
          result = "Camera permission was denied";
     
      } else {
      
          result = "Unknown Error $ex";
      
      }
    } on FormatException {
     
        result = "You pressed the back button before scanning anything";
     
    } catch (ex) {
     
        result = "Unknown Error $ex";
    
    }
  }



}