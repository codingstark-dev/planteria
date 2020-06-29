import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planteria/model/camp.dart';

class Database{
  final CollectionReference campaignCollection = Firestore.instance.collection('campaigns');

  Future createCampaign(CampaignModel campaign, String docName) async {

    Map<String, dynamic> data =  <String, dynamic>{
          "campName" : campaign.campName,
          "dueDate": campaign.dueDate,
          "target": campaign.target,
      };

    try{
      return await campaignCollection.document(docName).setData(data).whenComplete(() {
      print("Capmaign details added");
      }).catchError((e)=> print("error while adding Capmaign  $e"));
    }
    catch (e) {
      print("data not added with exception $e");
      return null;
    }
    


  }



}