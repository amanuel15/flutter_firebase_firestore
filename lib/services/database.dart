import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_test/models/product.dart';

class DatabaseService{

  final String uid;

  // collection reference
  final CollectionReference productsCollection = Firestore.instance.
      collection('products');

  DatabaseService({this.uid});
  
  Future updateUserData(String name, double price, int amount) async {
    return await productsCollection.document(uid).setData({
      'name': name,
      'price': price,
      'amount': amount,
    });
  }

  // product list from snapshot
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Product(
        name: doc.data['productName'] ?? '',
        amount: doc.data['TotalAmount'] ?? 0,
        productDescription: doc.data['productDescription'] ?? '',
      );
    }).toList();
  }

  // get products stream
  Stream<List<Product>> get products {
    return productsCollection.snapshots()
      .map(_productListFromSnapshot);
  }

}