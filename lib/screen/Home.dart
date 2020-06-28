import 'package:flutter/material.dart';
import 'package:planteria/helper/color.dart';
import 'package:planteria/screen/createCam.dart';
import 'package:planteria/service/locator.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(child: null),
      ),
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "Planteria".text.thin.make(),
          centerTitle: true,
          backgroundColor: Vx.hexToColor(sl<Customcolor>().greenish),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "No Campaigns",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ).p64(),
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
      ),
    );
  }
}
