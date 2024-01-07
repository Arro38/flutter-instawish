import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:instawish/lib/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    login() async {
      var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
      var url = Uri.parse('${SERVER_ADRESS}login_check');

      var body = {'username': username, 'password': password};

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      print(req.body);
      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        // print(resBody);
        // save token in local storage (shared preferences)
        var token = json.decode(resBody)['token'];
        print(token);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        // redirect to home page
      } else {
        print(res.reasonPhrase);
      }
    }

    // Return login form
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
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
            child: TextField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Username",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
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
            child: TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        // Login button with background color : Colors.cyan[300] and  text color : Colors.white
        ElevatedButton(
          onPressed: () {
            login();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan[300],
            foregroundColor: Colors.white,
            shadowColor: Colors.grey,
            elevation: 10,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 18, letterSpacing: 1.5, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
