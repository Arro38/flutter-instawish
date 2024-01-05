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
            SizedBox(
              width: 500,
              height: 200,
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10, left: 50),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 15,
                        offset: Offset(0.0, 0.75),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 2,
                    ),
                  ),
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Username")),
                ),
                Positioned(
                  left: -10,
                  child: UserAvatar(filename: "avatar2.jpg", border: true),
                ),
              ]),
            )
          ],
        ),
      ),
    ),
  );
}
