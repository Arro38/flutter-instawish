import 'package:flutter/material.dart';

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
        body: Container(
          height: 100,
          margin: EdgeInsets.only(top: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < 25; i++)
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar2.jpg'),
                        radius: 35,
                      ),
                    ),
                    Text("User $i")
                  ],
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
