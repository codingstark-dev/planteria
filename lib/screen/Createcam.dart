import 'package:flutter/material.dart';
import 'package:planteria/helper/color.dart';
import 'package:planteria/model/camp.dart';
import 'package:planteria/screen/campaign.dart';
import 'package:planteria/service/database.dart';
import 'package:planteria/service/locator.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateCampaign extends StatefulWidget {
  CreateCampaign({Key key}) : super(key: key);

  @override
  _CreateCampaignState createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {

  
  String campName;
  String dueDate;
  int target;
  CampaignModel campaign;


void validate() async {
  CampaignModel campaign = CampaignModel(
    campName: campName,
    dueDate: dueDate,
    target: target
  );

  print(campName);
  print(target);
  String docName = campName.replaceAll(" ", "");
 await Database().createCampaign(campaign, docName);

    showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Campaign Created",
              style: TextStyle(
                color: Colors.green[400]
              ),
              ),
              actions: [
                RaisedButton(
                color:Color.fromARGB(255, 0, 57, 106),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                } ,
                child: Text("OK"),
                )
              ],
            );
          }
          );


}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "Create Campaign".text.thin.make(),
          centerTitle: true,
          backgroundColor: Color(0xff4bbe9b),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Campaign Name",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400
          )
          ),

          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            decoration: InputDecoration(
              hintText: 'Eg. Green India',
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey[600].withOpacity(0.75) ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Colors.tealAccent[400].withOpacity(0.3),
            ),

            onChanged: (value) => campName = value,
          ),
          SizedBox(height: 20),

          Text("No. Of Sapling Target",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400
          )
          ),

          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Eg. 10000',
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey[600].withOpacity(0.75)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Colors.tealAccent[400].withOpacity(0.3),
            ),

            onChanged: (value) => target = int.parse(value)
          ),
          SizedBox(height: 20),

          
          Text("Deadline",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400
          )
          ),
          FlatButton(
              clipBehavior: Clip.hardEdge,
              color: Colors.tealAccent[400].withOpacity(0.3),
              onPressed: () async {
                await showDatePicker(
                    context: (context),
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2023),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor:
                              Vx.hexToColor(sl<Customcolor>().greenish),
                          accentColor:
                              Vx.hexToColor(sl<Customcolor>().greenish),
                          colorScheme: ColorScheme.light(
                              primary:
                                  Vx.hexToColor(sl<Customcolor>().greenish)),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child,
                      );
                    }).then((value){
                      setState(() {
                        dueDate = value.day.toString() + "/" + value.month.toString() + "/" + value.year.toString();
                      });
                        
                    } );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.centerLeft,
                child: dueDate==null?
                
                 Text("Select Date", style: TextStyle(fontSize: 16, color: Colors.grey[600].withOpacity(0.75), fontWeight: FontWeight.bold),)
                 :
                 Text(dueDate,style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold) )
                 ,
              )
              
              ),
              SizedBox(height: 30,),


          FlatButton(
            //  padding: EdgeInsets.fromLTRB(150, 0, 150, 0),
              color: Color(0xff4bbe9b),
              // hoverColor: Colors.white,
              // splashColor: Colors.white,
              onPressed: () {
                validate();
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Color(0xff4bbe9b),
                child: Text("CREATE",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
                ),
              )
              
              )
        ],
      )),
    );
  }
}
