import 'package:flutter/material.dart';

class LoadingScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
    body: Center(
      child: Card(
        child: Container(
          height: 50,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Processing Qr..",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 0, 57, 106),
              ),
              ),
              CircularProgressIndicator(strokeWidth: 2,),
            ],
          ),
        ),
      ),
      )
      );
  }
}