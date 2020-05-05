import 'package:cloud_firestore/cloud_firestore.dart';

class Repo{
  final db = Firestore.instance.collection('products').document('APQxJWzcJReX6Tbo5CMpTzUFTar2Nike2100');
  
  Future<String> getText() async{
    final stri = await db.get();
    if(stri.exists){
      print(stri.data['productName']);
      return stri.data['productName'];
    }
  }
  
}