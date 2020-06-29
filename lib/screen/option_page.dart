import 'package:flutter/material.dart';
import 'package:planteria/screen/gov_home.dart';
import 'package:planteria/screen/volenteer_home.dart';

class OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tree.png'),
                  fit: BoxFit.fill,
                )
              ),
            ),
              Column(
                
                children: <Widget>[
                SizedBox(height: 50,),
                Container(child: Center(child: Text("Planteria", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 45),),),),
                SizedBox(height: 50,),
                Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    height: 50,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60) 
                  ),
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                                      child: FlatButton(
                      color: Colors.green,
                      onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GovHome()));

                      },
                      child: Center(child: Text("Login as Government", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)))
                    ),
                  )
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    height: 50,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60) 
                  ),
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                                      child: FlatButton(
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VolenteerHome()));

                      },
                      child: Center(child: Text("Login as Volunteer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)))
                    ),
                  )
                  ),
                //  SizedBox(height: 100,),
                  Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tree2.png'),
                  fit: BoxFit.fill,
                )
              ),
            ),
              ],
              ),
        ],),
            ),
            );
  }
}