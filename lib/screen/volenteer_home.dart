import 'package:flutter/material.dart';
import 'package:planteria/helper/color.dart';
import 'package:planteria/service/locator.dart';
import 'package:velocity_x/velocity_x.dart';


class VolenteerHome extends StatefulWidget {
  @override
  _VolenteerHomeState createState() => _VolenteerHomeState();
}

class _VolenteerHomeState extends State<VolenteerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Container(
                child: Center(
                  child: Text("Welcome!\nMr. Volenteer",
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 20,
                    color: Vx.hexToColor(sl<Customcolor>().greenish)
                  ),
                  ),
                ),
            )),

            Container(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VolenteerHome()));
                  },
                  child: "Achievements".text.xl2.make(),
                  clipBehavior: Clip.antiAlias,
                  color: Vx.hexToColor(sl<Customcolor>().greenish),
                ),
              ),
            ),

            Container(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VolenteerHome()));
                  },
                  child: "My Account".text.xl2.make(),
                  clipBehavior: Clip.antiAlias,
                  color: Vx.hexToColor(sl<Customcolor>().greenish),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "Planteria".text.thin.make(),
          centerTitle: true,
          backgroundColor: Color(0xff4bbe9b),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(" Campaigns you are volenteering!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height -  130,
              child: ListView(
                children: [
                  Card(
                    color: Colors.greenAccent[100],
                    child: Container(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                color: Colors.green[300],
                                height: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text("Green Maharashtra", 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ),
                            ],
                          ),

                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text("Saplings Targeted: 5,00,000",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text("Saplings Planted : 1,23,000",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text("Volenteers : 103",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),

                          FlatButton(
                            onPressed: (){},
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.green[400],
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: Text("SCAN", 
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
          ],
        )
      ),
      
    );
  }
}