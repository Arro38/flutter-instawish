import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  final Widget childWidget;

  const MyLayout({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: SizedBox(
          width: 500,
          child: childWidget,
        ),
      ),
    );
  }
}
