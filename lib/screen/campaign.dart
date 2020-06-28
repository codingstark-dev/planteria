import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Campaign extends StatefulWidget {
  Campaign({Key key}) : super(key: key);

  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "Planteria".text.thin.make(),
          centerTitle: true,
          backgroundColor: Color(0xff4bbe9b),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            "Campaigns (1)".text.xl.make().centered().p12(),
            Container(
              child: Column(
                children: [
                  Text("Green India Volenteers (0)").text.xl.make().p12(),
                  "Status Bar".text.xl.make().centered().p12(),
                ],
              ),
            ).card.make().w(300),
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
        ),
      ),
    );
  }
}
