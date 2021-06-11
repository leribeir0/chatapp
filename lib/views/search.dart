import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: Container(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField()),
                Image.asset("assets/images/search.jpeg")
              ],
            )
          ],
        )));
  }
}
