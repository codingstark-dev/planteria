import 'package:flutter/material.dart';
import 'package:planteria/helper/color.dart';
import 'package:planteria/screen/campaign.dart';
import 'package:planteria/service/locator.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateCampaign extends StatefulWidget {
  CreateCampaign({Key key}) : super(key: key);

  @override
  _CreateCampaignState createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "Create Campaign".text.thin.make(),
          centerTitle: true,
          backgroundColor: Color(0xff4bbe9b),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          "Campaign Name".text.xl.start.make().pLTRB(0, 20, 0, 0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Eg. Green India',
              hintStyle: TextStyle(fontSize: 16, color: Vx.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Vx.hexToColor("#4bbe9b"),
            ),
          ).p12(),
          "No. Of Sapling Target".text.xl.start.make(),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Eg. 10000',
              hintStyle: TextStyle(fontSize: 16, color: Vx.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Vx.hexToColor(sl<Customcolor>().greenish),
            ),
          ).p12(),
          "Deadline".text.xl.start.make(),
          FlatButton(
              clipBehavior: Clip.hardEdge,
              color: Vx.hexToColor(sl<Customcolor>().greenish),
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
                    }).then((value) => print(value));
              },
              child: "Select Date".text.white.make()),
          FlatButton(
              padding: EdgeInsets.fromLTRB(150, 0, 150, 0),
              color: Vx.gray300,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Campaign()));
              },
              child: "Create".text.make())
        ],
      )),
    );
  }
}
