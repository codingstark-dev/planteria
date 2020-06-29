import 'package:flutter/material.dart';
import 'package:planteria/helper/color.dart';
import 'package:planteria/model/camp.dart';
import 'package:planteria/scan_files/scan.dart';
import 'package:planteria/service/database.dart';
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
                child: StreamBuilder<List<CampaignModel>>(
                  stream: Database().shops,
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Container(
                        child: Center(
                          child: AlertDialog(
                            content: Container(
                              height: 30,
                              child: Center(child: Text("Fetching Business details..")),
                            ),
                          )
                        ),
                      );
                      }else{
                    List<CampaignModel> campaignList = snapshot.data;
                      return Container(
                        height: 560,
                        child: ListView.builder(
                          itemCount: campaignList.length,
                          itemBuilder: (context, index){
                            CampaignModel camp = campaignList[index];
              return Container(
                padding: EdgeInsets.all(5),
                child: Card(
                  color: Colors.greenAccent[100],
                  child: Container(
                   // height: 100,
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
                              child: Text(camp.campName.toUpperCase(),
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
                          child: Text("Saplings Targeted: ${camp.target}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: Text("Saplings Planted : ${camp.planted}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: Text("Volenteers : ${camp.volenteers}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),

                        FlatButton(
                          onPressed: (){
                       ScanQr(context: context).scanQRFunction();
                         
                          },
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
                ),
              );
                        })
                      );
                      }

                }),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 20),
            // //  height: MediaQuery.of(context).size.height -  130,
            //   child: Card(
            //     color: Colors.greenAccent[100],
            //     child: Container(
            //      // height: 100,
            //       child: Column(
            //         children: [
            //           Stack(
            //             children: [
            //               Container(
            //                 color: Colors.green[300],
            //                 height: 40,
            //               ),
            //               Container(
            //                 alignment: Alignment.center,
            //                 child: Text("Green Maharashtra", 
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 25,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //                 ),
            //               ),
            //             ],
            //           ),

            //           Container(
            //             padding: EdgeInsets.all(5),
            //             alignment: Alignment.centerLeft,
            //             child: Text("Saplings Targeted: 5,00,000",
            //             style: TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //             ),
            //           ),
            //           Container(
            //             padding: EdgeInsets.all(5),
            //             alignment: Alignment.centerLeft,
            //             child: Text("Saplings Planted : 1,23,000",
            //             style: TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //             ),
            //           ),
            //           Container(
            //             padding: EdgeInsets.all(5),
            //             alignment: Alignment.centerLeft,
            //             child: Text("Volenteers : 103",
            //             style: TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //             ),
            //           ),

            //           FlatButton(
            //             onPressed: (){
            //               ScanQr(context: context).scanQRFunction();
            //             },
            //             child: Container(
            //               alignment: Alignment.center,
            //               color: Colors.green[400],
            //               height: 40,
            //               width: MediaQuery.of(context).size.width,
            //               child: Text("SCAN", 
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w300,
            //               ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   )
            // ),
          ],
        )
      ),
      
    );
  }
}