import 'package:flutter/material.dart';
import 'package:main_test/repo/repo.dart';
import 'package:main_test/services/auth.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final Repo repo = Repo();

  String myText;

  void fetch(){
    repo.getText().then((value) {
      setState(() {
        myText = value;
      });
    });
    print('the text: $myText');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: fetch,
                child: Text('fetch'),
              ),
              myText == null ? new Container(): new Text('$myText', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
