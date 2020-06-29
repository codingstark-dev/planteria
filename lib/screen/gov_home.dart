import 'package:flutter/material.dart';
import 'package:planteria/helper/color.dart';
import 'package:planteria/model/camp.dart';
import 'package:planteria/screen/createCam.dart';
import 'package:planteria/screen/more_info.dart';
import 'package:planteria/screen/volenteer_Home.dart';
import 'package:planteria/service/database.dart';
import 'package:planteria/service/locator.dart';
import 'package:velocity_x/velocity_x.dart';

class GovHome extends StatefulWidget {
  GovHome({Key key}) : super(key: key);

  @override
  _GovHomeState createState() => _GovHomeState();
}

class _GovHomeState extends State<GovHome> {
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
                  child: Text("Welcome!\nGovt. Of Maharashtra",
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 20,
                    color: Vx.hexToColor(sl<Customcolor>().greenish)
                  ),
                  ),
                ),
            )),

            Container(
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
                  child: "List of volenteers".text.xl2.make(),
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
          backgroundColor: Vx.hexToColor(sl<Customcolor>().greenish),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text('All Campaigns',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
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
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MoreInfo(camp: camp)));
                         
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.green[400],
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Text("More Info", 
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



            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CreateCampaign()));
                },
                child: "Create a campaign".text.xl2.make(),
                clipBehavior: Clip.antiAlias,
                color: Colors.grey[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}
