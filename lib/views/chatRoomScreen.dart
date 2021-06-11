import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/search.dart';
import 'package:chat_app/views/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo.png",
            height: 50,
          ),
          backgroundColor: Colors.lightBlue,
          actions: [
            GestureDetector(
              onTap: () {
                authMethods.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.logout)),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        ));
  }
}
