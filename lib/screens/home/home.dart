import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_test/models/product.dart';
import 'package:main_test/repo/repo.dart';
import 'package:main_test/screens/home/products_list.dart';
import 'package:main_test/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:main_test/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final Repo repo = Repo();

  String myText;

  void fetch() {
    repo.getText().then((value) {
      setState(() {
        myText = value;
      });
    });
    print('the text: $myText');
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('My App'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('sign out'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: ProductsList(),
      ),
    );
  }
}
