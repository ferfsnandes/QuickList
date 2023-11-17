import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Container(
        child: Text("User not found"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo Quicklist"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
            tooltip: "Sair",
          )
        ],
      ),
      body: Container(
        child: Text("${user.email}"),
      ),
    );
  }

  _logout() {
    FirebaseAuth.instance.signOut().then((result) {
      Navigator.of(context).pushNamedAndRemoveUntil("/", (_) => false);
    });
  }
}
