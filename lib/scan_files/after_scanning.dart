import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:planteria/model/camp.dart';
import 'package:planteria/service/database.dart';
import 'package:velocity_x/velocity_x.dart';

class AfterScanning extends StatefulWidget {
  final String result;
  AfterScanning({this.result});
  @override
  _AfterScanningState createState() => _AfterScanningState();
}

class _AfterScanningState extends State<AfterScanning> {
var campDetails;
bool loading = true;
int count;
CampaignModel camp;
void getCampaignDetails(){
  print("result in after scan is ${widget.result}");
  setState(() {
    loading = true;
  });
    Database().getCampDetails(widget.result).then((data) async {
        if(data.documents.isNotEmpty) {
          campDetails = data.documents[0];
          print(campDetails['campName']);
           camp = CampaignModel(
            campName: campDetails['campName'],
            dueDate: campDetails['dueDate'],
            target: campDetails['target'],
            planted: campDetails['planted']
          );
           count = camp.planted;
          String docName = camp.campName.replaceAll(" ", "");
    count = count + 1;
  await  Database().updateCount(count, docName);
setState(() {
            loading = false;
          });
        }else{

        }
    });
}



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCampaignDetails();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "Planted!".text.thin.make(),
          centerTitle: true,
          backgroundColor: Color(0xff4bbe9b),
        ),
      ),
      body: Container(
        child: loading? Center(
          child: CircularProgressIndicator()
        ) : 
        
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            AlertDialog(
              title: Container(
            decoration: BoxDecoration(
              color: Colors.green[400],
             // border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Scan Succesfull!  ",
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
                  Icons.check_circle, 
                  color: Colors.white, 
                  size: 22,
                  ),
              ),
                ],
              ),
            ),
            ),

            content: Container(
              height: 300,
              child: Column(
                children: [
                  // Container(
                  //   child: Text(camp.campName,
                  //   style: TextStyle(
                  //     fontSize: 26,
                  //     fontWeight: FontWeight.bold,
                      
                  //   ),
                  //   )
                  // ),
                  Container(
                    child: Text("You have succesfully\nplanted this TREE under\nGo green Campaign!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      
                    ),
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 4,
                  ),
                  Container(
                    child: Text("Total trees planted ${camp.planted + 1}!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ),
                  Divider(
                    thickness: 4,
                  ),
                ]
              )
            ),
            )
          ],)
        ),
      ),
    );
  }
}