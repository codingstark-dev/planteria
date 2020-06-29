import 'package:flutter/material.dart';
import 'package:planteria/model/camp.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../helper/color.dart';
import '../service/locator.dart';


class MoreInfo extends StatelessWidget {
  final CampaignModel camp;
  MoreInfo({this.camp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 50),
        child: VxAppBar(
          title: "More Info".text.thin.make(),
          centerTitle: true,
          backgroundColor: Vx.hexToColor(sl<Customcolor>().greenish),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              child: Text(camp.campName.toUpperCase(),
              style: TextStyle(
                color: Vx.hexToColor(sl<Customcolor>().greenish),
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              )
            ),
            Container(
            margin: EdgeInsets.only(top: 5),
            child: Card(
                  child: QrImage(
                  data: camp.campName,
                //  embeddedImage: AssetImage('assets/images/qr_image.png'),
                  version: QrVersions.auto,
                  size: 250,
                  gapless: true,
                  ),
            ),
          ),
          SizedBox(height: 20),
          
          Container(
            width: 200,
            height: 40,
            color: Colors.tealAccent,
            alignment: Alignment.center,
            child: Text("Download QR")
          )
          ],

        ),
      ),
      
    );
  }
}