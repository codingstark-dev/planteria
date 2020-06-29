import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';


class WrongQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
   appBar: AppBar(
     backgroundColor: Colors.transparent,
     elevation: 0.0,
     title: Text("Back"),
   ),


  body: Stack(
    children: [
      Center(
        child: AlertDialog(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.red[400],
         // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("INVALID QR!  ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
              AvatarGlow(
                  endRadius: 20,
                  duration: Duration(milliseconds : 600),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: Duration(milliseconds : 200),
                  startDelay: Duration(seconds: 0),
                  child: Icon(
                  Icons.cancel, 
                  color: Colors.white, 
                  size: 22,
                  ),
              ),
            ],
          ),
        ),
      ),
      content: Container(
        height: 55,
        child: Text("Please scan a QR code that has 'WaitQ!' logo on it",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 57, 106),
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        ),
      ),
      actions: [
        RaisedButton(
          color:Color.fromARGB(255, 0, 57, 106),
          onPressed: ()=> Navigator.of(context).pop(),
          child: Text("OK"),
          )
      ],
        ),
        ),
    ],
  ),
  );
  }
}