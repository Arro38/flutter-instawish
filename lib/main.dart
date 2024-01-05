import 'package:flutter/material.dart';
import 'package:instawish/components/user_avatar.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/logo.png"), height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "InstaWish",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.cyan[300],
            leading: Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.jpg"),
                ),
              ),
            ]),
        body: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(top: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i = 0; i < 25; i++)
                    Column(
                      children: [
                        UserAvatar(filename: "avatar2.jpg", border: true),
                        Text("User $i")
                      ],
                    ),
                ],
              ),
            ),
            Text("TEST")
          ],
        ),
      ),
    ),
  );
}
