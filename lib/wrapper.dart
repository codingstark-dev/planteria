import 'package:flutter/material.dart';
import 'package:planteria/screen/Createcam.dart';
import 'package:planteria/screen/volenteer_home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ("Gov" == "Gov") {
      return CreateCampaign();
    } else {
      return VolenteerHome();
    }
  }
}
