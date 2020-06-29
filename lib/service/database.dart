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


//get campaigns list

    List<CampaignModel> _camaignListFromSnapshot(QuerySnapshot snapshot){
      return snapshot.documents.map((doc){
          return CampaignModel(
            campName: doc.data['campName'] ?? '',
            dueDate: doc.data['dueDate'],
            target: doc.data['target'] ?? '',
            volenteers: doc.data['volenteers'] ?? 0,
            planted: doc.data['planted'] ?? 0,
          );
      }).toList();
    }

    //get shop sream
    Stream<List<CampaignModel>> get shops{
      return campaignCollection
    //  .where('businessStatus', isEqualTo: 'verified' )
    //  .where('shopLocation', isEqualTo: 'Hyderabad')
      .snapshots()
      .map(_camaignListFromSnapshot);
    }


  getCampDetails(String result){
    return Firestore.instance
      .collection('campaigns')
      .where('campName', isEqualTo: result )
      .getDocuments();
  }


Future updateCount(int count, String docName) async{
      try{
      final DocumentReference documentReference = Firestore.instance.document("campaigns/$docName");
      Map<String, dynamic> data =  <String, dynamic>{
          "planted" : count,
      };
      documentReference.updateData(data).whenComplete(() {
          }).catchError((e) =>  print("error while adding first time is $e"));
    }
    catch (e) {
      print("data not added with exception $e");
      return null;
    }
}


}